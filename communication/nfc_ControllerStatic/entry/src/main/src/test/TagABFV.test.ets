/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import tag from '@ohos.nfc.tag';
import rpc from '@ohos.rpc';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level,TestType,Size} from '../../../hypium/index';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag1: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let remoteTagService: rpc.RemoteObject = new rpc.RemoteObject("rpcTestAbility");

let nfcAtag:tag.NfcATag;
let nfcBTag:tag.NfcBTag;
let nfcFTag:tag.NfcFTag;
let nfcVTag:tag.NfcVTag;

let aTag: tag.TagInfo = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
    ],
    "tagRfDiscId": 1,
    "remoteTagService": remoteTagService,
};

let bTag: tag.TagInfo = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [1],
    "extrasData": [
        {
            "Sak": 0x08, "Atqa": "B000",
        },
    ],
    "tagRfDiscId": 1,
    "remoteTagService": remoteTagService,
};

let fTag: tag.TagInfo = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [4],
    "extrasData": [
        {
            "SystemCode": "A0C0", "Pmm": "131F",
        }
    ],
    "tagRfDiscId": 1,
    "remoteTagService": remoteTagService,
};

let vTag: tag.TagInfo = {
    "uid": [0x01, 0x02, 0x03, 0x04],
    "technology": [ 5 ],
    "extrasData": [
        {
            "ResponseFlags": 0x09, "DsfId": 0x13,
        }
    ],
    "tagRfDiscId": 1,
    "remoteTagService": remoteTagService,
};
export default function TagABFVTest() {
    describe("TagABFVTest", (): void=> {
        hilog.info(domain, tag1, '%{public}s', 'describe start');
        beforeAll(() => {
            try {
                nfcAtag = tag.getNfcA(aTag);
            }catch(error){
                error = error as BusinessError;
                if (error.code === 801) {
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] beforeAll getNfcA error is :  ' + error + " - " + error.code);
                    expect(801).assertEqual(error.code);
                } else {
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] beforeAll getNfcA failed ');
                    expect().assertFail();
                }
            }

            try {
                nfcBTag = tag.getNfcB(bTag);
            }catch(error){
                error = error as BusinessError;
                if (error.code === 801) {
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] beforeAll getNfcA error is :  ' + error + " - " + error.code);
                    expect(801).assertEqual(error.code);
                } else {
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] beforeAll getNfcA failed ');
                    expect().assertFail();
                }
            }

            try {
                nfcFTag = tag.getNfcF(fTag);
            } catch (error) {
                error = error as BusinessError;
                if (error.code === 801) {
                    hilog.info(domain, tag1,'%{public}s','[NFC_test] beforeAll getNfcF error is ' + error.code + " - " + error);
                    expect(801).assertEqual(error.code)
                } else {
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] beforeAll getNfcF failed ');
                    expect().assertFail();
                }
            }

            try {
                nfcVTag = tag.getNfcV(vTag);
            } catch (error) {
                error = error as BusinessError;
                if (error.code === 801) {
                    hilog.info(domain, tag1,'{public}s','[NFC_test] beforeAll getNfcV error is ' + error.code + " - " + error);
                    expect(801).assertEqual(error.code)
                } else {
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] beforeAll getNfcV failed ');
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag1, '%{public}s','beforeAll called');
        })
        beforeEach(() => {
            hilog.info(domain, tag1, '%{public}s','beforeEach called');
        })
        afterEach(() => {
            hilog.info(domain, tag1, '%{public}s','afterEach called');
        })
        afterAll(() => {
            hilog.info(domain,tag1, '%{public}s','afterAll called');
        })
        hilog.info(domain, tag1, '%{public}s', 'describe start11');

        /**
         * @tc.number SUB_COMMUNICATION_NFC_TagABFV_static_0100
         * @tc.name SUB_COMMUNICATION_NFC_TagABFV_static_0100
         * @tc.desc Check whether the NFC function is enabled.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_COMMUNICATION_NFC_TagABFV_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (nfcAtag != null && nfcAtag != undefined) {
                try {
                    let sak: int = nfcAtag.getSak();
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagABFV_static_0100 sak is ' + sak);
                } catch (error) {
                error = error as BusinessError;
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagABFV_static_0100 getsak error =  ' + error + ' - ' + error.code);
                    expect().assertFail();
                }
            } else {
                hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagABFV_static_0100 nfcAtag = null && = undefined:' );
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_NFC_TagABFV_static_0200
         * @tc.name SUB_COMMUNICATION_NFC_TagABFV_static_0200
         * @tc.desc Check whether the NFC function is enabled.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_COMMUNICATION_NFC_TagABFV_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (nfcAtag != null && nfcAtag != undefined) {
                try {
                    let Atqa: Array<int> = nfcAtag.getAtqa();
                } catch(error) {
                error = error as BusinessError;
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagABFV_static_0200 nfcAtag error =  ' + error + ' - ' + error.code);
                    expect().assertFail();
                }
            } else {
                hilog.info(domain,tag1,'%{public}s','[NFC_test]  nfcAtag = null && = undefined:' );
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_NFC_TagABFV_static_0300
         * @tc.name SUB_COMMUNICATION_NFC_TagABFV_static_0300
         * @tc.desc Check whether the NFC function is enabled.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_COMMUNICATION_NFC_TagABFV_static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (nfcBTag != null && nfcBTag != undefined) {
                try {
                    let AppData: Array<int> = nfcBTag.getRespAppData();
                } catch(error) {
                error = error as BusinessError;
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagABFV_static_0300 getRespAppData error =  ' + error + ' - ' + error.code);
                    expect().assertFail();
                }
            } else {
                hilog.info(domain,tag1,'%{public}s','[NFC_test]  nfcBTag = null && = undefined:' );
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_NFC_TagABFV_static_0400
         * @tc.name SUB_COMMUNICATION_NFC_TagABFV_static_0400
         * @tc.desc Check whether the NFC function is enabled.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_COMMUNICATION_NFC_TagABFV_static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (nfcBTag != null && nfcBTag != undefined) {
                try {
                    let Protocol:Array<int> = nfcBTag.getRespProtocol();
                } catch(error) {
                error = error as BusinessError;
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagABFV_static_0400 getRespProtocol error =  ' + error + ' - ' + error.code);
                    expect().assertFail();
                }
            } else {
                hilog.info(domain,tag1,'%{public}s','[NFC_test]  nfcBTag = null && = undefined:' );
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_NFC_TagABFV_static_0500
         * @tc.name SUB_COMMUNICATION_NFC_TagABFV_static_0500
         * @tc.desc Check whether the NFC function is enabled.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_COMMUNICATION_NFC_TagABFV_static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (nfcFTag != null && nfcFTag != undefined) {
                try {
                    let SystemCode: Array<int> = nfcFTag.getSystemCode();
                } catch(error) {
                error = error as BusinessError;
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagABFV_static_0500 getSystemCode error =  ' + error + ' - ' + error.code);
                    expect().assertFail();
                }
            } else {
                hilog.info(domain,tag1,'%{public}s','[NFC_test]  nfcFTag = null && = undefined:' );
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_NFC_TagABFV_static_0600
         * @tc.name SUB_COMMUNICATION_NFC_TagABFV_static_0600
         * @tc.desc Check whether the NFC function is enabled.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_COMMUNICATION_NFC_TagABFV_static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (nfcFTag != null && nfcFTag != undefined) {
                try {
                    let Pmm: Array<int> = nfcFTag.getPmm();
                } catch(error) {
                error = error as BusinessError;
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagABFV_static_0600 getPmm error =  ' + error + ' - ' + error.code);
                    expect().assertFail();
                }
            } else {
                hilog.info(domain,tag1,'%{public}s','[NFC_test]  nfcFTag = null && = undefined:' );
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_NFC_TagABFV_static_0700
         * @tc.name SUB_COMMUNICATION_NFC_TagABFV_static_0700
         * @tc.desc Check whether the NFC function is enabled.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_COMMUNICATION_NFC_TagABFV_static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (nfcVTag != null && nfcVTag != undefined) {
                try {
                    let ResponseFlags: int = nfcVTag.getResponseFlags();
                } catch(error) {
                error = error as BusinessError;
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagABFV_static_0700 getResponseFlags error =  ' + error + ' - ' + error.code);
                    expect().assertFail();
                }
            } else {
                hilog.info(domain,tag1,'%{public}s','[NFC_test]  nfcVTag = null && = undefined:' );
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number SUB_COMMUNICATION_NFC_TagABFV_static_0800
         * @tc.name SUB_COMMUNICATION_NFC_TagABFV_static_0800
         * @tc.desc Check whether the NFC function is enabled.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SUB_COMMUNICATION_NFC_TagABFV_static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            if (nfcVTag != null && nfcVTag != undefined) {
                try {
                    let DsfId: int = nfcVTag.getDsfId();
                } catch (error) {
                error = error as BusinessError;
                    hilog.info(domain,tag1,'%{public}s','[NFC_test] SUB_COMMUNICATION_NFC_TagABFV_static_0800 getDsfId error =  ' + error + ' - ' + error.code);
                    expect().assertFail();
                }
            } else {
                hilog.info(domain,tag1,'%{public}s','[NFC_test]  nfcVTag = null && = undefined:' );
                expect().assertFail();
            }
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}