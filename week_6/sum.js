function contains_sum(sum, list) {
  return do_contains_sum(sum, list, [])
} 

function do_contains_sum(sum, list, tally) {
  if (sum == 0) {
    return tally
  }

  if (list.length == 0) {
    return false
  }

  const h = list[0]
  const tail = list.slice(1)

  return do_contains_sum(sum, tail, tally) || do_contains_sum(sum - h, tail, tally.concat(h))
}

console.log(contains_sum(10, [1, -3, 5, 8, 7]))
