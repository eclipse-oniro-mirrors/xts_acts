/*
 * Copyright (c) 2026 RKH Corp.
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
export function testDataValidation() {
  const formData = [
    { field: 'name', value: 'John' },
    { field: 'email', value: 'john@example.com' },
    { field: 'age', value: '25' }
  ];
  const allFilled = formData.every(item => item.value !== '' && item.value !== null);
  return { result: allFilled, expected: true };
}

export function testSubsetDetection() {
  const array1 = [1, 2, 3, 4, 5, 6, 7];
  const array2 = [5, 7, 6];
  const isSubset = array2.every(element => array1.includes(element));
  return { result: isSubset, expected: true };
}

export function testStatusCheck() {
  const tasks = [
    { id: 1, status: 'completed' },
    { id: 2, status: 'completed' },
    { id: 3, status: 'completed' }
  ];
  const allCompleted = tasks.every(task => task.status === 'completed');
  return { result: allCompleted, expected: true };
}

export function testNumberCheck() {
  const numbers = [1, 2, 3, 4, 5];
  const allPositive = numbers.every(num => num > 0);
  return { result: allPositive, expected: true };
}

export function testTypeCheck() {
  const arr = ['a', 'b', 'c', 'd'];
  const allStrings = arr.every(item => typeof item === 'string');
  return { result: allStrings, expected: true };
}

export function testPropertyCheck() {
  const objects = [
    { name: 'Alice', age: 25 },
    { name: 'Bob', age: 30 },
    { name: 'Charlie', age: 35 }
  ];
  const allHaveName = objects.every(obj => obj.hasOwnProperty('name'));
  return { result: allHaveName, expected: true };
}

export function testWithOtherMethods() {
  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const evenNumbers = numbers.filter(n => n % 2 === 0);
  const allEvenPositive = evenNumbers.every(n => n > 0);
  return { result: allEvenPositive, expected: true };
}

export function testComplexBusinessLogic() {
  const cart = [
    { id: 1, name: 'Product 1', inStock: true },
    { id: 2, name: 'Product 2', inStock: true },
    { id: 3, name: 'Product 3', inStock: true }
  ];
  const canCheckout = cart.every(item => item.inStock);
  return { result: canCheckout, expected: true };
}