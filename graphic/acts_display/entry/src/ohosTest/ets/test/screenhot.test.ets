/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import screenshot from '@ohos.screenshot';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';

async function sleep(time: number) {
    let timeoutId: number = 0;
    let promise = new Promise<string>(resolve => {
        timeoutId = setTimeout(() => {
            resolve('sleep finished');
        }, time);
    })
    await promise;
    clearTimeout(timeoutId)
}
export default function screenHotTest() {
    describe('screenHotTest', () => {
        console.log('describe screenHotTest start!!!');
        beforeAll(() => {
            console.log('describe screenHotTest start!!!');
        });

        /**
         * @tc.name   tesScreenShot_Capture_ErrorCode201
         * @tc.number SUB_BASIC_WMS_SPCIAL_SCREEN_SHOT_CAPTURE_ERRORCODE_0100
         * @tc.desc   tesScreenShot_Capture_ErrorCode201 when without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('tesScreenShot_Capture_ErrorCode201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
            let caseName = 'tesScreenShot_Capture_ErrorCode201';
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin');
            try {
                let captureOptions: screenshot.CaptureOption = {
                    "displayId": 0
                }
                let promise = screenshot.capture(captureOptions)
                await promise.then((pixelMap: image.PixelMap) => {
                    console.log(caseName + 'Succeeded in capture')
                    expect().assertFail()
                    done()
                })
            } catch (exception) {
                console.error(caseName + 'Failed to pick Code: ' + JSON.stringify(exception.code)+':msg:'+ JSON.stringify(exception.message));
                expect(exception.message!=null).assertTrue();
                expect(exception.code == 801 || exception.code == 201).assertTrue()
                done()
            };
        })

        // /**
        //  * @tc.number    : SUB_BASIC_WMS_SPCIAL_SCREEN_HOT_0100
        //  * @tc.name      : tesScreenHot_pick
        //  * @tc.desc      : tesScreenHot_pick
        //  * @tc.size      : MediumTest
        //  * @tc.type      : Function
        //  * @tc.level     : Level3
        //  */
        /**
         * @tc.name   tesScreenHot_pick
         * @tc.number tesScreenHot_pick
         * @tc.desc   tesScreenHot_pick
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        // it('tesScreenHot_pick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        //     let caseName = 'tesScreenHot_pick';
        //     let msgStr = 'jsunittest ' + caseName + ' ';
        //     console.log(msgStr + 'begin');
        //     try {
        //         await screenshot.pick().then((pickInfo: screenshot.PickInfo) => {
        //             console.log(msgStr + 'pick Pixel bytes number: ' + pickInfo.pixelMap.getPixelBytesNumber());
        //             console.log(msgStr + 'pick Rect: ' + pickInfo.pickRect);
        //             pickInfo.pixelMap.release(); // PixelMap使用完后及时释放内存
        //             done();
        //         }).catch((err) => {
        //             console.log(msgStr + 'Failed to pick. Code: ' + JSON.stringify(err));
        //             if (err.code == 801) {
        //                 console.log(msgStr + '此设备不支持pick ');
        //                 done();
        //             } else {
        //                 expect(false).assertTrue();
        //                 done();
        //             }
        //
        //         });
        //     } catch (exception) {
        //         console.error(msgStr + 'Failed to pick Code: ' + JSON.stringify(exception));
        //         expect(false).assertTrue();
        //         done();
        //     };
        // })
    })
}
