/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

export function getCharacterType(char: string): string {
  switch (char) {
    case 'A':
      return 'Uppercase letter';
    case 'a':
      return 'Lowercase letter';
    case '1':
      return 'Digit';
    case '!':
      return 'Special character';
    default:
      return 'Unknown character';
  }
}

export enum ColorSet {
  RED,
  GREEN,
  BLUE
}

export function getEnumType(enumString: ColorSet): string {
  switch (enumString) {
    case enumString:
      return 'this enum is true';
    default:
      return 'Unknown enumString';
  }
}

export interface Person {
  name: string;
  age: number;
  role: string;
}

export function processPerson(person: Person): string {
  switch (person.role) {
    case 'admin':
      return `${person.name} is an admin.`;
    case 'editor':
      return `${person.name} is an editor.`;
    case 'viewer':
      return `${person.name} is a viewer.`;
    default:
      return `${person.name} has an unknown role: ${person.role}`;
  }
}

export function oneCaseClause(char: number): string {
  switch (char) {
    case 1:
      return 'the number is 1';
    default:
      return 'Unknown number';
  }
}

export function anySameCaseClause(char: number): string {
  switch (char) {
    case 1:
      return 'the number is 1';
    case 1:
      return 'the number is 1111';
    default:
      return 'Unknown number';
  }
}

export function anyCaseClause(char: number): string {
  switch (char) {
    case 1:
      return 'the number is 1';
    case 2:
      return 'the number is 2';
    default:
      return 'Unknown number';
  }
}

export function breakCaseClause(value: number): string {
  let result = '';
  switch (value) {
    case 0:
      result = 'The value is zero.';
      break;
    case 1:
      result = 'The value is one.';
      break;
    case 42:
      result = 'The value is the answer to life, the universe, and everything.';
      break;
    default:
      result = `The value is ${value}.`;
  }
  return result;
}

export function nullUndefinedCaseClause(value: null): string {
  switch (value) {
    case undefined:
      return 'The value is undefined.';
    default:
      return `The value is .`;
  }
}

export function undefinedCaseClause(value: undefined): string {
  switch (value) {
    case null:
      return 'The value is null.';
    case undefined:
      return 'The value is undefined.';
    default:
      return `The value is ${value}.`;
  }
}

export function nullCaseClause(value: null): string {
  switch (value) {
    case null:
      return 'The value is null.';
    case undefined:
      return 'The value is undefined.';
    default:
      return `The value is ${value}.`;
  }
}

export function breakAnyCaseDefaultClause(value: number): string {
  let result = '';
  switch (value) {
    case 0:
      result = 'The value is zero.';
      break;
    case 1:
      result = 'The value is one.';
      break;
    case 42:
      result = 'The value is the answer to life, the universe, and everything.';
      break;
    default:
      result = `The value is ${value}.`;
  }
  return result;
}

export function breakNotCaseDefaultClause(value: number): string {
  let result = '';
  switch (value) {
    case 0:
      result = 'The value is zero.';
    case 1:
      result = 'The value is one.';
    case 42:
      result = 'The value is the answer to life, the universe, and everything.';
    default:
      result = `The value is ${value}.`;
  }
  return result;
}

export function describeDayAndHour(day: number, hour: number): string {
  let message: string;
  switch (day) {
    case 0:
      message = 'Today is Sunday.';
      switch (hour) {
        case 8:
          message += ' It\'s 8 AM. Time for breakfast.';
          break;
        case 12:
          message += ' It\'s 12 PM. Time for lunch.';
          break;
        case 18:
          message += ' It\'s 6 PM. Time for dinner.';
          break;
        default:
          message += ' It\'s another time of the day.';
      }
      break;
    case 1:
      message = 'Today is Monday.';
      switch (hour) {
        case 9:
          message += ' It\'s 9 AM. Time to start work.';
          break;
        case 17:
          message += ' It\'s 5 PM. Time to go home.';
          break;
        default:
          message += ' It\'s another time of the day.';
      }
      break;
    case 2:
      message = 'Today is Tuesday.';
      switch (hour) {
        case 10:
          message += ' It\'s 10 AM. Time for a meeting.';
          break;
        case 15:
          message += ' It\'s 3 PM. Time for a coffee break.';
          break;
        default:
          message += ' It\'s another time of the day.';
      }
      break;
    default:
      message = ' It\'s another day of the week.';
  }
  return message;
}

export function handleUserAction(category: number, action: number): string {
  let result: string;
  switch (category) {
    case 1:
      result = 'Category 1 selected.';
      switch (action) {
        case 1:
          result += ' Action 1 in Category 1.';
          break;
        case 2:
          result += ' Action 2 in Category 1.';
          break;
        default:
          result += ' Unknown action in Category 1.';
      }
      break;
    case 2:
      result = 'Category 2 selected.';
      switch (action) {
        case 1:
          result += ' Action 1 in Category 2.';
          break;
        case 2:
          result += ' Action 2 in Category 2.';
          break;
        default:
          result += ' Unknown action in Category 2.';
      }
      break;
    default:
      result = 'Unknown category.';
  }
  return result;
}

export function nestedSwitchExample(value1: number, value2: number): string {
  let result: string;
  switch (value1) {
    case 1:
      result = 'Value1 is 1.';
      switch (value2) {
        case 1:
          result += ' Value2 is 1.';
          break;
        case 2:
          result += ' Value2 is 2.';
          break;
        default:
          result += ' Value2 is not 1 or 2.';
      }
      break;
    case 2:
      result = 'Value1 is 2.';
      switch (value2) {
        case 1:
          result += ' Value2 is 1.';
          break;
        case 2:
          result += ' Value2 is 2.';
          break;
        default:
          result += ' Value2 is not 1 or 2.';
      }
      break;
    default:
      result = 'Value1 is not 1 or 2.';
  }
  return result;
}




