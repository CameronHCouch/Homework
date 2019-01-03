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

const isPrime = (num) => {
  if (num < 2) {
    return false;
  }

  for (let i = 2; i < num; i++) {
    if (num % i === 0 && num !== 2) {
      return false;
    }
  }
  return true;
};

const firstNPrimes = (num) => {
  let counter = 0
  let result = []
  for (let i = 2; counter < num ; i++) {
    if (isPrime(i)) {
      counter++;
      result.push(i);
    }
  }
  return result;
};

const sumOfNPrimes = (num) => {
  let sum = 0
  let primeArr = firstNPrimes(num);
  for (let i = 0; i < primeArr.length; i++) {
    sum += primeArr[i];
  }
  return sum;
};