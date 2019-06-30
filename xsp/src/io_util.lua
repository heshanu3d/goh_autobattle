i = {}

function string:split(sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	self:gsub(pattern, function (c) fields[#fields + 1] = c end)
	return fields
end

function i.init()
	f = assert(io.open("conf.txt",'r'))
	sret = {}
	i = 0
	j = 0
	sline = f:read("*line")
	res = sline:split(",")
	sret[i] = res[0]
	sret[j] = res[1]
	print(sret[i])
	print(sret[j])
	i = i + 1
	j = j + 1
	sline = f:read("*line")
	while sline
	do
		res = sline:split(",")
		sret[i] = res[0]
		sret[j] = res[1]
		print(sret[i])
		print(sret[j])
		i = i + 1
		j = j + 1
		sline = f:read("*line")
	end
	f.close()
end