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


export default function UIContentRouterPushNamedRouteNullUndefinedTest() {
  describe('UIContentRouterPushNamedRouteNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIContentRouterPushNamedRouteNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContextRouterNullUndefined/UIContentRouterPushNamedRouteNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContentRouterPushNamedRouteNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("UIContentRouterPushNamedRouteNullUndefined" == pages.name)) {
          console.info("get UIContentRouterPushNamedRouteNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UIContentRouterPushNamedRouteNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContentRouterPushNamedRouteNullUndefinedTest page error:" + err);
      }
      console.info("UIContentRouterPushNamedRouteNullUndefinedTest beforeEach end");
      done();
    });

    /**
     * @tc.name   UIContentRouterPushNamedRouteNullUndefinedTest_0001
     * @tc.number UIContentRouterPushNamedRouteNullUndefinedTest_0001
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterPushNamedRouteNullUndefinedTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0001 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('pushNamedRouteUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0001 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterPushNamedRouteNullUndefinedTest_0002
     * @tc.number UIContentRouterPushNamedRouteNullUndefinedTest_0002
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterPushNamedRouteNullUndefinedTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0002 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('pushNamedRouteNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0002' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0002 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterPushNamedRouteNullUndefinedTest_0003
     * @tc.number UIContentRouterPushNamedRouteNullUndefinedTest_0003
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterPushNamedRouteNullUndefinedTest_0003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function)=> {
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0003 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('pushNamedRouteEmpty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0003' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0003 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterPushNamedRouteNullUndefinedTest_0004
     * @tc.number UIContentRouterPushNamedRouteNullUndefinedTest_0004
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterPushNamedRouteNullUndefinedTest_0004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function)=> {
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0004 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('pushNamedRouteRecoverableTrue');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0004' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0004 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterPushNamedRouteNullUndefinedTest_0005
     * @tc.number UIContentRouterPushNamedRouteNullUndefinedTest_0005
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterPushNamedRouteNullUndefinedTest_0005',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function)=> {
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0005 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('pushNamedRouteMode');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0005' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterPushNamedRouteNullUndefinedTest_0005 END');
      done();
    });
  })
}
