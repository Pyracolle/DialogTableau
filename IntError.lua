return function(act: any, goal: string)
	if typeof(act) == "Instance" then
		if not act:IsA(goal) then
			return error(string.format(goal.." expected, got %s"), act.ClassName)
		end
	else
		if typeof(act) ~= goal then
			return error(string.format(goal.." expected, got %s"), act)
		end
	end
end;

-- IntError

-- Designed to avoid errors in modules with 
-- few differential checks between types and instances
-- @AntonioGJ9
