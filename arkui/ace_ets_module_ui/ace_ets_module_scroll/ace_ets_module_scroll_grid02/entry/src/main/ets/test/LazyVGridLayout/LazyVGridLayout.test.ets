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

export default function LazyVGridLayout() {
  describe('LazyVGridLayout', () => {
    beforeEach(async (done: Function) => {
      console.info("LazyVGridLayout beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyVGridLayout/LazyVGridLayout",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LazyVGridLayout state pages:" + JSON.stringify(pages));
        if (!("LazyVGridLayout" == pages.name)) {
          console.info("get LazyVGridLayout pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LazyVGridLayout page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyVGridLayout page error:" + err);
      }
      console.info("LazyVGridLayout beforeEach end");
      done();
    });

    /**
     * @tc.name   LazyVGridLayout_0100
     * @tc.number LazyVGridLayout_001
     * @tc.desc   LazyVGridLayout component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LazyVGridLayout_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[LazyVGridLayout_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LazyVGridLayout_key');
      console.info("[LazyVGridLayout_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[LazyVGridLayout_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[LazyVGridLayout_0100] columnsTemplate: " + JSON.stringify(JSON.parse(strJson).$attrs.columnsTemplate));
      console.info("[LazyVGridLayout_0100] rowsGap: " + JSON.stringify(JSON.parse(strJson).$attrs.rowsGap));
      console.info("[LazyVGridLayout_0100] columnsGap: " + JSON.stringify(JSON.parse(strJson).$attrs.ColumnsGap));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual("LazyVGridLayout");
      expect(JSON.parse(strJson).$attrs.columnsTemplate).assertEqual("1fr 1fr");
      expect(JSON.parse(strJson).$attrs.rowsGap).assertEqual("10.00vp");
      console.info('[LazyVGridLayout_0100] END');
      done();
    });
  })
}
