/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

// @ts-nocheck
import image from '@ohos.multimedia.image'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'
// @ts-ignore
import mypixelmap from "libimagePixelmap.so"

export default function nativeApiImageJsunit() {
    describe('napiTest', function () {

        beforeAll(function () {
            console.info('beforeAll case');
        })

        beforeEach(function () {
            isTimeOut = false;
            console.info('beforeEach case');
        })

        afterEach(function () {
            console.info('afterEach case');
        })

        afterAll(function () {
            console.info('afterAll case');
        })

        /* *
            * @tc.number    : TC_001
            * @tc.name      : Test OH_GetImageInfo, OH_AccessPixels, OH_UnAccessPixels
            * @tc.desc      :
            * @tc.size      :
            * @tc.type      : Functional
            * @tc.level     : FWK Layer
        */

        it('TC_001', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts)
                .then( pixelmap => {
                    if (pixelmap == null) {
                        console.info('TC_001 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                        return;
                    }

                    console.info('TC_001 test |begin');

                    console.info('TC_001 test |GetImageInfo');
                    mypixelmap.testGetImageInfo(pixelmap);

                    console.info('TC_001 test |AccessPixels');
                    mypixelmap.testAccessPixels(pixelmap);

                    console.info('TC_001 test |release begin');
                    pixelmap.release();
                    console.info('TC_001 test |release end');

                    console.info('TC_001 test |UnAccessPixels');
                    mypixelmap.testUnAccessPixels(pixelmap);

                    console.info('TC_001 test |release again begin');
                    pixelmap.release();
                    console.info('TC_001 test |release again end');

                    expect(true).assertTrue();
                    done();

                    console.info('TC_001 test |end');
                })
                .catch(error => {
                    console.log('TC_001 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })
    })
}
