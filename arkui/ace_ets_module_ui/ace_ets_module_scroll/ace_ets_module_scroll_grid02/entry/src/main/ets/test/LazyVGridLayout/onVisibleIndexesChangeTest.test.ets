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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function onVisibleIndexesChangeTest() {
  describe('onVisibleIndexesChangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("onVisibleIndexesChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyVGridLayout/onVisibleIndexesChangeTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onVisibleIndexesChangeTest state pages:" + JSON.stringify(pages));
        if (!("onVisibleIndexesChangeTest" == pages.name)) {
          console.info("get onVisibleIndexesChangeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onVisibleIndexesChangeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onVisibleIndexesChangeTest page error:" + err);
      }
      console.info("onVisibleIndexesChangeTest beforeEach end");
      done();
    });


    /**
     * @tc.name   onVisibleIndexesChangeTest_0100
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_ONVISIBLEINDEXESCHANGE_0100
     * @tc.desc   Test LazyVGridLayout component with onVisibleIndexesChange event,
     *             verify that LazyVGridLayout component exists and is correctly configured
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('onVisibleIndexesChangeTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[onVisibleIndexesChangeTest_0100] START');

      let strJson: string = getInspectorByKey('lazyVGridLayout_on1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[onVisibleIndexesChangeTest_0100] obj.$type: " + obj.$type);
      console.info("[onVisibleIndexesChangeTest_0100] obj.$attrs: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual('LazyVGridLayout');

      console.info('[onVisibleIndexesChangeTest_0100] END');
      done();
    })

    /**
     * @tc.name   onVisibleIndexesChangeTest_0200
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_ONVISIBLEINDEXESCHANGE_START_0200
     * @tc.desc   Test LazyVGridLayout onVisibleIndexesChange callback start parameter,
     *             verify that start index is correctly reported when component renders
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('onVisibleIndexesChangeTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[onVisibleIndexesChangeTest_0200] START');

      let strJson: string = getInspectorByKey('text_visible_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[onVisibleIndexesChangeTest_0200] obj.$attrs: " + JSON.stringify(obj.$attrs));

      let content: string = obj.$attrs.content as string;
      console.info("[onVisibleIndexesChangeTest_0200] content: " + content);
      expect(content).assertContain('Start: 0');
      console.info('[onVisibleIndexesChangeTest_0200] END');
      done();
    })

    /**
     * @tc.name   onVisibleIndexesChangeTest_0300
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_ONVISIBLEINDEXESCHANGE_END_0300
     * @tc.desc   Test LazyVGridLayout onVisibleIndexesChange callback end parameter,
     *             verify that end index is correctly reported when component renders
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('onVisibleIndexesChangeTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[onVisibleIndexesChangeTest_0300] START');

      let strJson: string = getInspectorByKey('text_visible_end');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[onVisibleIndexesChangeTest_0300] obj.$attrs: " + JSON.stringify(obj.$attrs));

      let content: string = obj.$attrs.content as string;
      console.info("[onVisibleIndexesChangeTest_0300] content: " + content);
      expect(content).assertContain('End: 5');
      console.info('[onVisibleIndexesChangeTest_0300] END');
      done();
    })

    /**
     * @tc.name   onVisibleIndexesChangeTest_0400
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_ONVISIBLEINDEXESCHANGE_0400
     * @tc.desc   Test LazyVGridLayout onVisibleIndexesChange callback triggered status,
     *             verify that callback is triggered during component lifecycle
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('onVisibleIndexesChangeTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[onVisibleIndexesChangeTest_0400] START');
      let driver = Driver.create();
      let scrollColumn = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollColumn.scrollSearch(ON.id('item2_10'));

      let strJson: string = getInspectorByKey('text_visible_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[onVisibleIndexesChangeTest_0400] obj.$attrs: " + JSON.stringify(obj.$attrs));
      let content: string = obj.$attrs.content as string;
      console.info("[onVisibleIndexesChangeTest_0400] content: " + content);
      expect(content).assertContain('Start: -1');

      let strJson2: string = getInspectorByKey('text_visible_end');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info("[onVisibleIndexesChangeTest_0400] obj2.$attrs: " + JSON.stringify(obj2.$attrs));
      let content2: string = obj2.$attrs.content as string;
      console.info("[onVisibleIndexesChangeTest_0400] content: " + content2);
      expect(content2).assertContain('End: -1');

      console.info('[onVisibleIndexesChangeTest_0400] END');
      done();
    })

    /**
     * @tc.name   onVisibleIndexesChangeTest_0500
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_ONVISIBLEINDEXESCHANGE_0500
     * @tc.desc   Test LazyVGridLayout onVisibleIndexesChange start and end relationship,
     *             verify that start index is less than or equal to end index
     *             API version: 26.0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('onVisibleIndexesChangeTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[onVisibleIndexesChangeTest_0500] START');

      let strJsonStart: string = getInspectorByKey('text_visible_start');
      let objStart: Record<string, ESObject> = JSON.parse(strJsonStart);
      let contentStart: string = objStart.$attrs.content as string;
      let startIndex: number = parseInt(contentStart.replace('Start: ', '').trim());

      let strJsonEnd: string = getInspectorByKey('text_visible_end');
      let objEnd: Record<string, ESObject> = JSON.parse(strJsonEnd);
      let contentEnd: string = objEnd.$attrs.content as string;
      let endIndex: number = parseInt(contentEnd.replace('End: ', '').trim());

      console.info("[onVisibleIndexesChangeTest_0500] startIndex: " + startIndex);
      console.info("[onVisibleIndexesChangeTest_0500] endIndex: " + endIndex);

      expect(startIndex <= endIndex).assertTrue();
      console.info('[onVisibleIndexesChangeTest_0500] END');
      done();
    })
  })
}
