function [fid, pnt, label] = read_ctf_pos(filename)

% READ_CTF_POS reads Polhemus file created with the CTF digitizer application
%
% Use as
%   [fid, pnt, label] = read_ctf_pos(filename)
% Input:
% filename  - Polhemus ASCII file containing digitized points
%
% Output:
% fid   - fiducial         locations of fiducials
% pnt   - sensor/headshape locations 
% label - labels of the fiducials
%
% IMPORTANT: Note that Polhemus data files should be -ASCII files with
% extension .pos generated by the CTF digitizer

% Copyright (C) 2012: Jan-Mathijs Schoffelen
% $Id: read_ctf_pos.m 945 2010-04-21 17:41:20Z roboos $

[pth,nam,ext] = fileparts(filename);
if ~strcmp(ext,'.pos')
    warndlg(sprintf('Wrong input file format\n'));
    return
end

fid  = fopen(filename, 'r');
data = textscan(fid, '%s%f%f%f','headerlines',1);
fclose(fid);

label = data{1};
pnt   = cat(2, data{2:end});

isfid = false(1,numel(label));
for k = 1:numel(label)
  if any(strcmp(label{k},{'Rcoil','Lcoil','nasion','left','right','lpa','rpa','nas','rc','lc'}))
    isfid(k) = true;
  end
end
fid   = pnt(isfid,:);
label = label(isfid);
pnt   = pnt(~isfid,:);

% average the double occurrences
[u,i1,i2] = unique(label);
newlabel  = cell(numel(i1),1);
newfid    = zeros(numel(i1),3);
for k = 1:numel(i1)
  newlabel{k} = u{k};
  newfid(k,:) = mean(fid(i2==k,:),1);
end
fid   = newfid;
label = newlabel;

% rename the fiducials into lpa/rpa/nasion
for k = 1:numel(label)
  if any(strcmp(label{k}, {'nasion' 'nose' 'nz'}))
    label{k} = 'nas';
  end
  if any(strcmp(label{k}, {'left'}))
    label{k} = 'lpa';
  end
  if any(strcmp(label{k}, {'right'}))
    label{k} = 'rpa';
  end
  if any(strcmp(label{k}, {'rc'}))
    label{k} = 'Rcoil';
  end
  if any(strcmp(label{k}, {'lc'}))
    label{k} = 'Lcoil';
  end
end
