/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export const REPEAT_COUNT = 2;

export const DATA_TYPE_LIST = ['ARRAY', 'NUMBER', 'BOOLEAN', 'FUNCTION', 'STRING', 'OBJECT', 'NULL', 'UNDEFINED'];

interface ObjectType { 
  id?: string 
}

let RANDOM_BEGIN_POSITION = 0;
let RANDOM_BEGIN_POSITION_A = 2;
let STRING_RANDOM_LENGTH = 2064;
let BOOLEAN_RANDOM_LENGTH = 2;
let ARRAY_RANDOM_LENGTH = 10;
let ARRAY_RANDOM_TYPE_LENGTH = 3;
let OBJECT_RANDOM_LENGTH = 2;
let FUNCTION_RANDOM_LENGTH = 2;

//string ascii
let STRING_RANDOM_LENGTH_A = 48;
let STRING_RANDOM_LENGTH_B = 58;
let STRING_RANDOM_LENGTH_C = 65;
let STRING_RANDOM_LENGTH_D = 91;
let STRING_RANDOM_LENGTH_E = 97;
let STRING_RANDOM_LENGTH_F = 122;

// Return integer random, the range is: [iStart, iEnd)
function getIntegerRandom(iStart:number, iEnd:number) {
  let decimal:number = iStart + (iEnd - iStart) * Math.random();
  return Math.floor(decimal);
}

// return string random, the string length is: [0, 2064)
function stringTest():string {
  // string
  let res = '';

  // string length
  let iNumber = getIntegerRandom(RANDOM_BEGIN_POSITION, STRING_RANDOM_LENGTH);
  for (let iAsciiToChar = RANDOM_BEGIN_POSITION; iAsciiToChar < iNumber; iAsciiToChar++) {
    let iNumberString = getIntegerRandom(RANDOM_BEGIN_POSITION, RANDOM_BEGIN_POSITION_A);

    switch (iNumberString) {
      case 0:
        // get ascii [0-9]
        iNumber = getIntegerRandom(STRING_RANDOM_LENGTH_A, STRING_RANDOM_LENGTH_B);
        break;
      case 1:
        // get ascii [A-Z]
        iNumber = getIntegerRandom(STRING_RANDOM_LENGTH_C, STRING_RANDOM_LENGTH_D);
        break;
      case 2:
      default:
        // get ascii [a-z]
        iNumber = getIntegerRandom(STRING_RANDOM_LENGTH_E, STRING_RANDOM_LENGTH_F);
        break;
    }
    // from ascii to char
    let asciiToChar = String.fromCharCode(iNumber);
    res += asciiToChar;
  }
  console.log('The stringTest of this fuzzTest random:' + res);
  return res;
};

// return number random, the number length is: [Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER]
function numberTest():number {
  const res = getIntegerRandom(Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER + 1);
  console.log('The numberTest of this fuzzTest random:' + res);
  return res;
};

// return boolean random, the boolean value is: 0->(false), 1->(true)
function booleanTest():boolean {
  console.log('The booleanTest of this fuzzTest random');
  return Boolean(getIntegerRandom(RANDOM_BEGIN_POSITION, BOOLEAN_RANDOM_LENGTH));
};

// null
function nullTest() {
  console.log('The nullTest of this fuzzTest random');
  return null;
};

// undefined
function undefinedTest() {
  console.log('The undefinedTest of this fuzzTest random');
  return undefined;
};

// return array random, the array value is: string,number,bool
function arrayTest(): string[] | number[] | boolean[] {
  let arrValue :string[] | number[] | boolean[] = [];

  // array length
  let iNumber = getIntegerRandom(RANDOM_BEGIN_POSITION, ARRAY_RANDOM_LENGTH);
  for (let iArrNumber = 0; iArrNumber < iNumber; iArrNumber++) {
    // string,number,bool
    iNumber = getIntegerRandom(RANDOM_BEGIN_POSITION, ARRAY_RANDOM_TYPE_LENGTH);
    switch (iNumber) {
      case 0:
        arrValue[iArrNumber] = stringTest();
        break;
      case 1:
        arrValue[iArrNumber] = numberTest();
        break;
      case 2:
        arrValue[iArrNumber] = booleanTest();
        break;
      default:
        arrValue[iArrNumber] = '';
    }
  }
  console.log('The arrayTest of this fuzzTest random:' + arrValue);
  return arrValue;
};

// return objectTest random, the objectTest value is: null, not null
function objectTest() {
  let objectA : ObjectType = {};
  let objectb : ObjectType = { id: 'objectTest' };
  let objectB: ObjectType = {
    id: objectb.id
  };

  console.log('The objectTest of this fuzzTest random');
  return getIntegerRandom(RANDOM_BEGIN_POSITION, OBJECT_RANDOM_LENGTH) ? objectA : objectB;
};

// return functionTest random, the functionTest value is: null, not null
function functionTest():ObjectType {
  let functionA : ObjectType = {};
  let functionB : ObjectType= { id: 'functionTest' };

  console.log('The functionTest of this fuzzTest random');
  return getIntegerRandom(RANDOM_BEGIN_POSITION, FUNCTION_RANDOM_LENGTH) ? functionA : functionB;
};

// return fuzz data
const getFuzzData = (datatype: string) => {
  switch (datatype) {
    case 'ARRAY':
      let array1:string[] | number[] | boolean[] = arrayTest();
      let array2:string[] | number[] | boolean[] = array1
      if (isNaN(Number(array1.join("")))) {
        return array2;
      } else {
        getFuzzData(DATA_TYPE_LIST[0]);
      }
    case 'BOOLEAN':
      let res1 = booleanTest()
      return res1;
    case 'FUNCTION':
      let res2 = functionTest()
      return res2;
    case 'NULL':
      let res3 = nullTest()
      return res3;
    case 'NUMBER':
      let res4 = numberTest()
      return res4;
    case 'OBJECT':
      let res5 = objectTest()
      return res5;
    case 'STRING':
      let res6 = stringTest()
      return res6;
    case 'UNDEFINED':
      let res7 = undefinedTest()
      return res7;
    default:
      let res = stringTest()
      return res;
  }
};

export { getFuzzData, stringTest, numberTest, booleanTest, nullTest, undefinedTest, objectTest, arrayTest, functionTest };
