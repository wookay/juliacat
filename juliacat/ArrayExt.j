function index(ary::Array, item)
  local found_idx = -1
  local idx = 1
  for elt = ary
    if isequal(elt, item)
      found_idx = idx
      break
    end
    idx += 1
  end
  found_idx
end
