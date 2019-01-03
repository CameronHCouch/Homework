function madLib(verb,adj,noun){
  return `We shall ${verb} the ${adj} ${noun}!`
};

const isSubstring = (searchString, subString) => {
  return searchString.indexOf(subString) !== -1
};

const fizzBuzz = (arr) => {
  let result = []
  for (let i = 0; i < arr.length; i++){
    if ((i % 3 === 0 && i % 5 !== 0) || (i % 5 === 0 && i % 3 !== 0)) {
      continue;
    }
    result.push(i);
  }
  return result
};