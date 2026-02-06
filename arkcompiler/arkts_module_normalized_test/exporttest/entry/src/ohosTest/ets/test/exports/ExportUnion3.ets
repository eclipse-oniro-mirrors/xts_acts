/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
interface NumObj {
  type: 'number';
  value: number;
}

interface StrObj {
  type: 'string';
  value: string;
}

type ComplexUnion = NumObj | StrObj;

const myComplexObject2: ComplexUnion = {
  type: 'number',
  value: 42,
};
const myComplexObject4: ComplexUnion = {
  type: 'number',
  value: 45
};

export const myComplexObject3: ComplexUnion = {
  type: 'number',
  value: 43
};

const myComplexObject5: ComplexUnion = {
  type: 'number',
  value: 46
};

export default myComplexObject2;

export { myComplexObject4 };

export { myComplexObject5 as ComplexObject1 };

export * from './ExportUnion4';

export * as aaExport2 from './ExportUnion4';