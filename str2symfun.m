function f = str2symfun(strFun)
%STR2SYMF Summary of this function goes here
%   Detailed explanation goes here
expression = '([\w])([(\s\w,)]*)\s*=\s*(.*)';
varExspression = '[\w]+';
[full,strParts] = regexpi(strFun,expression,'match','tokens');
varsStr = regexpi(strParts{1}{2},varExspression,'match');
eqn = str2sym(strParts{1}{3});
syms vars f(x)
for i = 1:length(varsStr)
    vars(i)=sym(varsStr{i});
end
f(vars)=eqn;
end

