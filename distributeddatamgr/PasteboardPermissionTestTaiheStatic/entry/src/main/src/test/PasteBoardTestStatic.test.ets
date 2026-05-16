/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, Hypium, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import pasteboard from '@ohos.pasteboard';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import { fileIo as fs, fileUri } from '@kit.CoreFileKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let g_context: common.UIAbilityContext;
let dstDir: string = context.distributedFilesDir + '/dst';
const ARRAY_BUFFER = new ArrayBuffer(256);

export default function pasteBoardTest() {

    describe("pasteBoardTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })
        beforeEach(() => {
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            systemPasteboard.clearDataSync();
            hilog.info(domain, tag, '%{public}s', 'beforeEach start');
        })

        /**
         * @tc.name   SUB_SystemPasteboard_Permission_Static_0010
         * @tc.number SUB_SystemPasteboard_Permission_Static_0010
         * @tc.desc   Test permission API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_SystemPasteboard_Permission_Static_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0010 start");
            try {
                let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
                let textData = 'Hello World!';
                let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, textData);
                await systemPasteboard.setData(pasteData);
                let data: pasteboard.PasteData = await systemPasteboard.getData();
                let text: string = data.getPrimaryText();
                expect(text).assertEqual('');
                done();
            } catch (err) {
                err = err as BusinessError;
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err === null).assertTrue();
            }
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0010 end");
        })

        /**
         * @tc.name   SUB_SystemPasteboard_Permission_Static_0020
         * @tc.number SUB_SystemPasteboard_Permission_Static_0020
         * @tc.desc   Test permission API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_SystemPasteboard_Permission_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0020 start");
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            try {
                await systemPasteBoard.setData(pasteData);
                systemPasteBoard.getData((err: BusinessError | null, data: pasteboard.PasteData | undefined) => {
                    expect(err == null).assertTrue();
                    done();
                })
            } catch (err) {
                hilog.info(domain, tag, "System pasteBoard set pastedata error,error: " + err);
                expect(false).assertTrue();
                done();
            }
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0020 end");
        })

        /**
         * @tc.name   SUB_SystemPasteboard_Permission_Static_0030
         * @tc.number SUB_SystemPasteboard_Permission_Static_0030
         * @tc.desc   Test permission API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_SystemPasteboard_Permission_Static_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0030 start");
            let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
            let systemPasteBoard = pasteboard.getSystemPasteboard();
            try {
                systemPasteBoard.setData(pasteData, (err) => {
                    let data = systemPasteBoard.getDataSync();
                    let hasType: boolean = data.hasType('string');
                    expect(hasType).assertFalse();
                    done();
                });
            } catch (err) {
                err = err as BusinessError;
                console.error("SUB_PasteBoard_ETS_Static error is: " + err.message + "; " + err.code);
                expect(err === null).assertTrue();
            }
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0030 end");
        })

        /**
         * @tc.name   SUB_SystemPasteboard_Permission_Static_0040
         * @tc.number SUB_SystemPasteboard_Permission_Static_0040
         * @tc.desc   Test permission API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_SystemPasteboard_Permission_Static_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0040 start");
            let plainTextData = new unifiedDataChannel.UnifiedData();
            let plainText = new unifiedDataChannel.PlainText();
            let systemPasteboard = pasteboard.getSystemPasteboard();
            plainText.details = {
                "Key": 'delayPlaintext',
                "Value": 'delayPlaintext'
            };
            plainText.textContent = 'textContent';
            plainText.textAbstract = 'textAbstract';
            plainTextData.addRecord(plainText);
            systemPasteboard.clearDataSync();
            let result = systemPasteboard.hasDataSync();
            expect(result).assertFalse();
            let result1: number = systemPasteboard.getChangeCount();
            try {
                await systemPasteboard.setUnifiedData(plainTextData);
                let result2: number = systemPasteboard.getChangeCount();
                expect(result2).assertEqual(result1 + 1);
                let data: unifiedDataChannel.UnifiedData = await systemPasteboard.getUnifiedData();
                expect(data != null).assertTrue();
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
                expect(err === null).assertTrue();
                done();
            }
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0040 end");
        })

        /**
         * @tc.name   SUB_SystemPasteboard_Permission_Static_0050
         * @tc.number SUB_SystemPasteboard_Permission_Static_0050
         * @tc.desc   Test permission API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_SystemPasteboard_Permission_Static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0050 start");
            let plainTextData = new unifiedDataChannel.UnifiedData();
            let plainText = new unifiedDataChannel.PlainText();
            let systemPasteboard = pasteboard.getSystemPasteboard();
            plainText.details = {
                "Key": 'delayPlaintext',
                "Value": 'delayPlaintext'
            };
            plainText.textContent = 'textContent';
            plainText.textAbstract = 'textAbstract';
            try {
                plainTextData.addRecord(plainText);
                systemPasteboard.clearDataSync();
                let result = systemPasteboard.hasDataSync();
                hilog.info(domain, tag, "result:" + result);
                expect(result).assertFalse();
                let result1: number = systemPasteboard.getChangeCount();
                systemPasteboard.setUnifiedDataSync(plainTextData);
                let result2: number = systemPasteboard.getChangeCount();
                let data: unifiedDataChannel.UnifiedData = systemPasteboard.getUnifiedDataSync();
                expect(data != null).assertTrue();
                expect(result2).assertEqual(result1 + 1);
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, 'Failed to set UnifiedData.Cause:' + err.message);
                expect(err === null).assertTrue();
                done();
            }
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0050 end");
        })

        /**
         * @tc.name   SUB_SystemPasteboard_Permission_Static_0060
         * @tc.number SUB_SystemPasteboard_Permission_Static_0060
         * @tc.desc   Test permission API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_SystemPasteboard_Permission_Static_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0060 start");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                systemPasteboard.setAppShareOptions(pasteboard.ShareOption.INAPP);
                hilog.info(domain, tag, "setAppShareOptions setAppShareOptions inApp success");
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "setAppShareOptions setAppShareOptions inApp fail " + err.message);
                hilog.info(domain, tag, "err.code " + err.code);
                expect(err.code).assertEqual(201);
                done();
            }
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0060 end");
        })

        /**
         * @tc.name   SUB_SystemPasteboard_Permission_Static_0070
         * @tc.number SUB_SystemPasteboard_Permission_Static_0070
         * @tc.desc   Test permission API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_SystemPasteboard_Permission_Static_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0070 start");
            let systemPasteboard = pasteboard.getSystemPasteboard();
            try {
                systemPasteboard.removeAppShareOptions();
                hilog.info(domain, tag, "setAppShareOptions removeAppShareOptions success");
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "setAppShareOptions removeAppShareOptions fail" + err.message);
                hilog.info(domain, tag, "err.code " + err.code);
                expect(err.code).assertEqual(201);
                done();
            }
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0070 end");
        })

        /**
         * @tc.name   SUB_SystemPasteboard_Permission_Static_0080
         * @tc.number SUB_SystemPasteboard_Permission_Static_0080
         * @tc.desc   Test permission API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_SystemPasteboard_Permission_Static_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0080 start");
            let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
            systemPasteboard.clearDataSync();
            try {
                let dstUri: string = fileUri.getUriFromPath(dstDir);
                expect(dstUri != null).assertTrue();
                let params: pasteboard.GetDataParams = {
                    destUri: dstUri,
                    progressIndicator: pasteboard.ProgressIndicator.NONE
                };
                await systemPasteboard.getDataWithProgress(params);
                hilog.info(domain, tag, "getDataWithProgress success");
                done();
            } catch (err) {
                err = err as BusinessError;
                //涉及到权限问题，权限不足就会报错误码12900010
                hilog.info(domain, tag, "Remove specified record fail,error code is: " + err.message + err.code)
                expect(err.code).assertEqual(12900010);
                done();
            }
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0080 end");
        })

        /**
         * @tc.name   SUB_SystemPasteboard_Permission_Static_0090
         * @tc.number SUB_SystemPasteboard_Permission_Static_0090
         * @tc.desc   Test permission API functionality.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_SystemPasteboard_Permission_Static_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0090 start");
            let filePath: string = context.filesDir + '/src';
            let fileFullName: string = filePath + '/test1.txt';
            let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
            let systemPasteboard = pasteboard.getSystemPasteboard();
            await systemPasteboard.setData(pasteData);
            let dstUri: string = fileUri.getUriFromPath(dstDir);
            let params: pasteboard.GetDataParams = {
              destUri: dstUri,
              progressIndicator: pasteboard.ProgressIndicator.DEFAULT
            };
            try {
                await systemPasteboard.getDataWithProgress(params);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "Remove specified record fail,error code is: " + err.message + err.code)
                expect(err.code).assertEqual(12900010);
                done();
            }
            hilog.info(domain, tag, "SUB_SystemPasteboard_Permission_Static_0090 end");
        })
    })
}