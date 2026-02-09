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

import nfcATagSessionTest from './ATagSession.test.js';
import nfcControllerTest from './Controller.test.js';
import nfcIsoDepTagTest from './IsoDepTag.test.js';
import nfcMifareClassicTag from './MifareClassicTag.test.js';
import nfcMifareUltralightTag from './MifareUltralightTag.test.js';
import nfcTagABFVTest from './TagABFV.test.js';
import nfcNDEFTagTest from './NDEFTag.test.js';
import EmptyTest from './Empty.test.js';
import GetParam from './GetParam.test.js';
let info = canIUse("SystemCapability.Communication.NFC.Core");
export default function testsuite() {
    if (info)
    {
        let infoNfc = GetParam("const.nfc.not_support", "false");
        if (infoNfc == "false") {
            nfcATagSessionTest();
            nfcControllerTest();
            nfcIsoDepTagTest();
            nfcMifareClassicTag();
            nfcMifareUltralightTag();
            nfcNDEFTagTest();
            nfcTagABFVTest();
        } else {
            EmptyTest();
        }
    } else {
        EmptyTest();
    }
}