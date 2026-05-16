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

const SLEEP_TIME = 1000;
const HEIGHT = 600;
const WIDTH = 200;

export default function GridContentSize() {
  describe('GridContentSize', () => {
    beforeEach(async (done: Function) => {
      console.info("GridContentSize beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/GridContentSize",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridContentSize state pages:" + JSON.stringify(pages));
        if (!("GridContentSize" == pages.name)) {
          console.info("get GridContentSize pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridContentSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridContentSize page error:" + err);
      }
      console.info("GridContentSize beforeEach end");
      done();
    });

    /**
     * @tc.name   test_grid_getContentSize_001
     * @tc.number test_grid_getContentSize_001
     * @tc.desc   the callback for getting content size, which determines that the value is 600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_grid_getContentSize_001', Level.LEVEL0, async (done: Function) => {
      console.info('test_grid_getContentSize_001 START');
      let driver = Driver.create();
      let getContentSize = await driver.findComponent(ON.id('GetContentSize'));
      await getContentSize.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('GridContentHeight');
      console.info('test_grid_getContentSize_001 content: ' + parseInt(JSON.parse(strJson).$attrs.content));
      console.info('test_grid_getContentSize_001 HEIGHT: ' + HEIGHT);
      expect(Math.floor(Math.abs(parseInt(JSON.parse(strJson).$attrs.content) - HEIGHT)) <= 1).assertTrue();
      console.info('[test_grid_getContentSize_001] END');
      done();
    });

    /**
     * @tc.name   test_grid_getContentSize_002
     * @tc.number test_grid_getContentSize_002
     * @tc.desc   the callback for getting width content size, which determines that the value is 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_grid_getContentSize_002', Level.LEVEL0, async (done: Function) => {
      console.info('test_grid_getContentSize_002 START');
      let driver = Driver.create();
      let getContentSize = await driver.findComponent(ON.id('GetContentSize'));
      await getContentSize.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('GridContentWidth');
      console.info('test_grid_getContentSize_002 content: ' + parseInt(JSON.parse(strJson).$attrs.content));
      console.info('test_grid_getContentSize_002 WIDTH: ' + WIDTH);
      expect(Math.floor(Math.abs(parseInt(JSON.parse(strJson).$attrs.content) - WIDTH)) <= 1).assertTrue();
      console.info('[test_grid_getContentSize_002] END');
      done();
    });
  })
}
