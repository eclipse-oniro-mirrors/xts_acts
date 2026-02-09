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

export default function listNoMakeObserved() {
  describe('listNoMakeObserved', () => {
    beforeEach(async (done: Function) => {
      console.info("listNoMakeObserved beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listNoMakeObserved",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listNoMakeObserved state pages:" + JSON.stringify(pages));
        if (!("listNoMakeObserved" == pages.name)) {
          console.info("get listNoMakeObserved pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listNoMakeObserved page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listNoMakeObserved page error:" + err);
      }
      console.info("listNoMakeObserved beforeEach end");
      done();
    });

    /**
     * @tc.name   listNoMakeObserved_0100
     * @tc.number listNoMakeObserved_001
     * @tc.desc   Testing the childDefaultSize for ChildrenMainSize without MakeObserved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('listNoMakeObserved_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[listNoMakeObserved_0100] START');
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('no_observed_default'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('no_observed_str');
      console.info("[listNoMakeObserved_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('childDefaultSize: 30');
      console.info('[listNoMakeObserved_0100] END');
      done();
    });

    /**
     * @tc.name   listNoMakeObserved_0200
     * @tc.number listNoMakeObserved_002
     * @tc.desc   Testing the splice for ChildrenMainSize without MakeObserved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('listNoMakeObserved_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[listNoMakeObserved_0200] START');
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('no_observed_splice'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let listItem2 = CommonFunc.getComponentRectOnScreen('no_observed_2');
      let listItem3 = CommonFunc.getComponentRectOnScreen('no_observed_3');
      await CommonFunc.sleep(500);
      let size_splice = listItem3.bottom - listItem2.bottom
      console.info("[listNoMakeObserved_0200] size_splice is: " + size_splice);
      console.info("[listNoMakeObserved_0200] vp2px(50) is: " + vp2px(50));
      expect(Math.floor(Math.abs(size_splice - vp2px(50))) <= 1).assertTrue();
      console.info('[listNoMakeObserved_0200] END');
      done();
    });

    /**
     * @tc.name   listNoMakeObserved_0300
     * @tc.number listNoMakeObserved_003
     * @tc.desc   Testing the update for ChildrenMainSize without MakeObserved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('listNoMakeObserved_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[listNoMakeObserved_0300] START');
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('no_observed_update'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let listItem0 = CommonFunc.getComponentRectOnScreen('no_observed_0');
      let listItem1 = CommonFunc.getComponentRectOnScreen('no_observed_1');
      await CommonFunc.sleep(500);
      let size_update = listItem1.bottom - listItem0.bottom
      console.info("[listNoMakeObserved_0300] size_update is: " + size_update);
      console.info("[listNoMakeObserved_0300] vp2px(40) is: " + vp2px(40));
      expect(Math.floor(Math.abs(size_update - vp2px(40))) <= 1).assertTrue();
      console.info('[listNoMakeObserved_0300] END');
      done();
    });
  })
}
