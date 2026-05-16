/**
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

import UDMFApiTest from "./UDMF.test";
import UDMFApiDescriptorTest from "./UDMFApiDescriptor.test";
import UDMFApiDataAllTest from "./UDMFApiDataAll.test";
import UDMFApiUtdUdsTest from "./UDMFApiUtdUds.test";
import UtdMimeTypeTest from "./UtdMimeTypeTest.test";
import UDMFApiPromiseTest from "./UDMFApiPromise.test";
import UDMFJsApiTest from "./UDMFJsAPI.test";
import UtdFileNameTest from "./UtdFileNameExtentions.test";
import UDMFDragBigDataJsApiTest from "./UDMFDragBigDataJsApi.test";
import UDMFDragBigDataPartJsApiTest from "./UDMFDragBigDataJsApiPart.test";
export default function testsuite() {
    UDMFApiTest();
    UDMFApiDescriptorTest();
    UDMFApiDataAllTest();
    UDMFApiUtdUdsTest();
    UtdMimeTypeTest();
    UDMFApiPromiseTest();
    UDMFDragBigDataJsApiTest();
    UDMFJsApiTest();
    UtdFileNameTest();
    UDMFDragBigDataPartJsApiTest();
}
