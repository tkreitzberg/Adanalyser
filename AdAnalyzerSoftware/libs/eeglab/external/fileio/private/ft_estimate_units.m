function unit = ft_estimate_units(size)

% FT_ESTIMATE_UNITS tries to determine the units of a geometrical object by
% looking at its size and by relating this to the approximate size of the
% human head according to the following table:
%   from  0.050 to   0.500 -> meter
%   from  0.500 to   5.000 -> decimeter
%   from  5.000 to  50.000 -> centimeter
%   from 50.000 to 500.000 -> millimeter
%
% Use as
%   unit = ft_estimate_units(size)
%
% This function will return one of the following strings
%   'm'
%   'dm'
%   'cm'
%   'mm'
%
% See also FT_CONVERT_UNITS

% Copyright (C) 2009-2011, Robert Oostenveld
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
% $Id: ft_estimate_units.m 4973 2011-12-09 15:33:12Z roboos $

% do some magic based on the size
unit = {'m', 'dm', 'cm', 'mm'};
indx = round(log10(size)+1.8);

% FIXME we can consider to give a warning if the index is not very decisive, 
% e.g round(1.49) results in meter, but round(1.51) results in decimeter

if indx>length(unit)
  indx = length(unit);
  warning('assuming that the units are "%s"', unit{indx});
end

if indx<1
  indx = 1;
  warning('assuming that the units are "%s"', unit{indx});
end

unit = unit{indx};
