function [val] = filetype_check_header(filename, head, offset)

% FILETYPE_CHECK_HEADER helper function to determine the file type
% by reading the first number of bytes of a file and comparing them
% to a known string (c.f. magic number).

% Copyright (C) 2003-2006 Robert Oostenveld
%
% This file is part of FieldTrip, see http://www.ru.nl/neuroimaging/fieldtrip
% for the documentation and details.
%
%    FieldTrip is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    FieldTrip is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with FieldTrip. If not, see <http://www.gnu.org/licenses/>.
%
% $Id: filetype_check_header.m 5653 2012-04-18 14:18:42Z eelspa $

% these are for remembering the type on subsequent calls with the same input arguments
persistent previous_argin previous_argout

if nargin<3
  offset = 0;
end

current_argin = {filename, head, offset};
if isequal(current_argin, previous_argin)
  % don't do the detection again, but return the previous value from cache
  val = previous_argout;
  return
end

if iscell(filename)
  % compare the header of multiple files
  val = zeros(size(filename));
  for i=1:length(filename)
    val(i) = filetype_check_header(filename{i}, head, offset);
  end
elseif isdir(filename)
  % a directory cannot have a header
  val = false;
else
  % read the first few bytes from the file and compare them to the desired header
  fid = fopen(filename, 'rb');
  if fid<0
    warning_once(sprintf('could not open %s', filename));
    val = false;
  else
    fseek(fid, offset, 'cof');
    if iscell(head)
      for i=1:length(head)
        len(i) = length(head{i});
      end
      [str, siz] = fread(fid, max(len), 'uint8=>char');
      fclose(fid);
      for i=1:length(head)
        val = strncmp(str, head{i}, len(i));
        if val
          break
        end
      end
    else
      [str, siz] = fread(fid, length(head), 'uint8=>char');
      fclose(fid);
      if siz~=length(head)
        warning_once(sprintf('could not read the header from %s', filename));
        val = false;
      else
        val = all(str(:)==head(:));
      end
    end
  end
end

% remember the current input and output arguments, so that they can be
% reused on a subsequent call in case the same input argument is given
current_argout  = val;
previous_argin  = current_argin;
previous_argout = current_argout;

return % main()
