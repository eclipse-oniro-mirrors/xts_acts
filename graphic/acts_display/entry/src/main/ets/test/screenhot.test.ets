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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import screenshot from '@ohos.screenshot';

export default function screenHotTest(context, windowStage, abilityStorage) {
    describe('screenHotTest', function () {
        console.log('describe screenHotTest start!!!')
        beforeAll(() => {
            console.log('describe screenHotTest start!!!')
        })

        async function sleep(time) {
            let timeoutId = null;
            let promise = new Promise(resolve => {
                timeoutId = setTimeout(() => {
                    resolve('sleep finished');
                }, time);
            })
            let result = await promise;
            clearTimeout(timeoutId)
        }
        // /**
        //  * @tc.number    : SUB_BASIC_WMS_SPCIAL_SCREEN_HOT_0100
        //  * @tc.name      : tesScreenHot_pick
        //  * @tc.desc      : tesScreenHot_pick
        //  * @tc.size      : MediumTest
        //  * @tc.type      : Function
        //  * @tc.level     : Level3
        //  */
        // it('tesScreenHot_pick', 0, async function (done) {
        //     let caseName = 'tesScreenHot_pick';
        //     let msgStr = 'jsunittest ' + caseName + ' ';
        //     console.log(msgStr + 'begin');
        //     try {
        //         await screenshot.pick().then((pickInfo: screenshot.PickInfo) => {
        //             console.log(msgStr + 'pick Pixel bytes number: ' + pickInfo.pixelMap.getPixelBytesNumber());
        //             console.log(msgStr + 'pick Rect: ' + pickInfo.pickRect);
        //             pickInfo.pixelMap.release(); // PixelMap使用完后及时释放内存
        //             expect(true).assertTrue();
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
