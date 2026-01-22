-- made by SirKingBinx
-- (C) 2023 - 2026 bedroom.rbxl

local tokenizer = {}

local function either(T: any) return tostring(T) or T end

-- Used in the tokenizer to construct tables.
-- @param T: table to package
-- @return string Tokenized version of T
function tokenizer.construct(T: any): string
	local result: string = ""

	if T ~= nil and typeof(T) == "table" then
		for index: any, item: any in T do
			if result == "" then
				result = string.format("%s:%s", either(index), either(item))
			else
				result = string.format("%s;%s:%s", result, either(index), either(item))
			end
		end
	else
		warn(string.format("Empty or unindexable table (Skipped parsing) [mem:%s]", T or "nil"))
		-- maybe fixed i got no idea
		result = ""
	end

	return result
end

-- Deconstruct S
-- @param S: string
-- @return table Table representing S
function tokenizer.deconstruct(S: string)
	if typeof(S) ~= "string" then
		print("deconstruction failed: not a string")
		return {}
	end
	
	local result = {}
	local eacharg = string.split(S, ";")

	for idx: number, item: string in eacharg do
		local temp = string.split(item, ":")
		result[temp[1]] = temp[2]
	end
end

return tokenizer
