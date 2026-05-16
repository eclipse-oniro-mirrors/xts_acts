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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component, Point} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common'

const SLEEP_TIME = 1500;


export default function UIContentRouterGetStateByUrlNullUndefinedTest() {
  describe('UIContentRouterGetStateByUrlNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIContentRouterGetStateByUrlNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContextRouterNullUndefined/UIContentRouterGetStateByUrlNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContentRouterGetStateByUrlNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("UIContentRouterGetStateByUrlNullUndefined" == pages.name)) {
          console.info("get UIContentRouterGetStateByUrlNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UIContentRouterGetStateByUrlNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContentRouterGetStateByUrlNullUndefinedTest page error:" + err);
      }
      console.info("UIContentRouterGetStateByUrlNullUndefinedTest beforeEach end");
      done();
    });

    /**
     * @tc.name   UIContentRouterGetStateByUrlNullUndefinedTest_0001
     * @tc.number UIContentRouterGetStateByUrlNullUndefinedTest_0001
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterGetStateByUrlNullUndefinedTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('UIContentRouterGetStateByUrlNullUndefinedTest_0001 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('getStateByUrlUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterGetStateByUrlNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterGetStateByUrlNullUndefinedTest_0001 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterGetStateByUrlNullUndefinedTest_0002
     * @tc.number UIContentRouterGetStateByUrlNullUndefinedTest_0002
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterGetStateByUrlNullUndefinedTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('UIContentRouterGetStateByUrlNullUndefinedTest_0002 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('getStateByUrlNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterGetStateByUrlNullUndefinedTest_0002' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterGetStateByUrlNullUndefinedTest_0002 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterGetStateByUrlNullUndefinedTest_0003
     * @tc.number UIContentRouterGetStateByUrlNullUndefinedTest_0003
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterGetStateByUrlNullUndefinedTest_0003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function)=> {
      console.info('UIContentRouterGetStateByUrlNullUndefinedTest_0003 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('getStateByUrlEmpty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterGetStateByUrlNullUndefinedTest_0003' + JSON.stringify(obj.$attrs.width));
      console.info('UIContentRouterGetStateByUrlNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterGetStateByUrlNullUndefinedTest_0003 END');
      done();
    });
  })
}
