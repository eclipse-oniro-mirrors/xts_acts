/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

export interface FirstInterface {
  firstProp: string;
  getFirstMethod:()=> string;
}

export interface SecondInterface {
  secondProp: string;
  getSecondMethod:()=> string;
}

export interface CombinedInterface extends FirstInterface, SecondInterface {
  combinedProp: string;
  getCombinedInfo:()=> string;
}

export default {
  firstProp: 'first_value',
  secondProp: 'second_value',
  combinedProp: 'combined_value',
  getFirstMethod: () => 'FirstInterface method',
  getSecondMethod: () => 'SecondInterface method',
  getCombinedInfo: () => 'CombinedInterface info'
} as CombinedInterface;
