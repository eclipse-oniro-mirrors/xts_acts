/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// import EsNativeErrorsTest from "./EsNativeErrors.test";
import EsObjectTest from "./EsObject.test";
// import EsParseIntTest from "./EsParseInt.test";
// import EsNumberTest from "./EsNumber.test";
// import EsRegExpTest1 from "./EsRegExp001.test";
// import EsRegExpTest2 from "./EsRegExp002.test";
// import EsRegExpTest3 from "./EsRegExp003.test";
// import EsStringTest from "./EsString.test";
import EsWeakMapTest from "./EsWeakMap.test";
// import EsWeakSetTest from "./EsWeakSet.test";
// import EsTypedArrayTest1 from "./EsTypedArray001.test";
// import EsTypedArrayTest2 from "./EsTypedArray003.test";
// import EsTypedArrayTest3 from "./EsTypedArray003.test";
// import EsTypedArrayTest4 from "./EsTypedArray004.test";
// import EsTypedArrayTest5 from "./EsTypedArray005.test";
// import EsTypedArrayCtrTest from "./EsTypedArrayCtr.test";

export default function testsuite() {
  EsObjectTest();
  EsWeakMapTest();
}