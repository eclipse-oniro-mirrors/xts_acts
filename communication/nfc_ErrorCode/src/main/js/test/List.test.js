/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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


import nfcIsoDepErrorTest from './error.IsoDepTag.js'
import MifareClassicErrorTest from './error.MifareClassicTag.js'
import UltralightTagErrorTest from './error.MifareUltralightTag.js'
import nfcNDEFErrorTest from './error.NDEFTag.js'
import nfcTagABFVErrorTest from './error.TagABFV.js'
import parameter from '@ohos.systemparameter';
let info = parameter.getSync("const.SystemCapability.Communication.NFC.Core" ,"false");
export default function testsuite() {
if (info != "false")
{
    nfcIsoDepErrorTest();
    MifareClassicErrorTest();
    UltralightTagErrorTest();
    nfcNDEFErrorTest();
    nfcTagABFVErrorTest();
}
}