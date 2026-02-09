'use static'
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
const myNumber: int = 45;

interface num {
  number1: number;
}

const exportObject: num = {
  number1: myNumber,
};
const exportObject2: num = {
  number1: 46,
};

export default exportObject;

export { exportObject2 };

export const myExport: num = { number1: 45 };

export { exportObject2 as exportedNumberObj };

export * from './ExportNumber4';

export * as aaExport from './ExportNumber4';