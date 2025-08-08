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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';


export default function LayoutInspectorTest() {
    describe('LayoutInspectorTest', () => {
        beforeEach(async (done: Function) => {
            console.info("LayoutInspectorTest beforeEach start");
            let options: router.RouterOptions = {
                url: 'MainAbility/pages/inspector/layoutInspector',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get LayoutInspectorTest state pages:" + JSON.stringify(pages));
                if (!("layoutInspector" == pages.name)) {
                    console.info("get LayoutInspectorTest pages.name:" + JSON.stringify(pages.name));
                    let result = await router.pushUrl(options);
                    await CommonFunc.sleep(2000);
                    console.info("push LayoutInspectorTest page result:" + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push LayoutInspectorTest page error:" + err);
            }
            console.info("LayoutInspectorTest beforeEach end");
            done();
        });
        afterEach(async () => {
        });

        /**
         * @tc.number    LayoutInspectorTest_0100
         * @tc.name      LayoutInspectorTest_0100
         * @tc.desc      test isLayoutInspector
         * @tc.level:    Level 1
         * @tc.type :    isLayoutInspector
         * @tc.size :
         */
        it('ISLAYOUT_INSPECTOR_0100', Level.LEVEL1, async (done: Function) => {
            console.info('ISLAYOUT_INSPECTOR_0100 START');
            let testStr: string = globalThis.context.getFilteredInspectorTree(['isLayoutInspector'])
            console.info("ISLAYOUT_INSPECTOR_0100 testStr: " + testStr);
            console.info('ISLAYOUT_INSPECTOR_0100 content' + JSON.parse(testStr).content);
            let isContainContent: boolean = JSON.parse(testStr).content === undefined ? false : true
            expect(isContainContent).assertEqual(true);
            console.info('[ISLAYOUT_INSPECTOR_0100] END');
            done();
        });
        
        /**
         * @tc.number    LayoutInspectorTest_0200
         * @tc.name      LayoutInspectorTest_0200
         * @tc.desc      test not isLayoutInspector
         * @tc.level:    Level 1
         * @tc.type :    isLayoutInspector
         * @tc.size :
         */
        it('ISLAYOUT_INSPECTOR_0200', Level.LEVEL1, async (done: Function) => {
            console.info("ISLAYOUT_INSPECTOR_0200 start: ");
            let testStr: string = globalThis.context.getFilteredInspectorTree(['content'])
            console.info("ISLAYOUT_INSPECTOR_0200 testStr: " + testStr);
            console.info('ISLAYOUT_INSPECTOR_0200 content' + JSON.parse(testStr).content);
            let isContainContent: boolean = JSON.parse(testStr).content === undefined ? true : false
            expect(isContainContent).assertEqual(true);
            console.info('[ISLAYOUT_INSPECTOR_0200] END');
            done();
          });
    })
}