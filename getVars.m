function varsStr = getVars(strFun)
%GETVARS Summary of this function goes here
%   Detailed explanation goes here
expression = '([\w])([(\s\w,)]*)\s*=\s*(.*)';
varExspression = '[\w]+';
[full,strParts] = regexpi(strFun,expression,'match','tokens');
varsStr = regexpi(strParts{1}{2},varExspression,'match');
end

