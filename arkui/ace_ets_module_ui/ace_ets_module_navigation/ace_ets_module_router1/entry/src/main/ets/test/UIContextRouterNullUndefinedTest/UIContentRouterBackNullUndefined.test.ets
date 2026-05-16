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


export default function UIContentRouterBackNullUndefinedTest() {
  describe('UIContentRouterBackNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIContentRouterBackNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContextRouterNullUndefined/UIContentRouterBackNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContentRouterBackNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("UIContentRouterBackNullUndefined" == pages.name)) {
          console.info("get UIContentRouterBackNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UIContentRouterBackNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContentRouterBackNullUndefinedTest page error:" + err);
      }
      console.info("UIContentRouterBackNullUndefinedTest beforeEach end");
      done();
    });

    /**
     * @tc.name   UIContentRouterBackNullUndefinedTest_0001
     * @tc.number UIContentRouterBackNullUndefinedTest_0001
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterBackNullUndefinedTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('UIContentRouterBackNullUndefinedTest_0001 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('backUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterBackNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterBackNullUndefinedTest_0001 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterBackNullUndefinedTest_0002
     * @tc.number UIContentRouterBackNullUndefinedTest_0002
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterBackNullUndefinedTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('UIContentRouterBackNullUndefinedTest_0002 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('backNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterBackNullUndefinedTest_0002' + JSON.stringify(obj.$attrs.width));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterBackNullUndefinedTest_0002 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterBackNullUndefinedTest_0003
     * @tc.number UIContentRouterBackNullUndefinedTest_0003
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterBackNullUndefinedTest_0003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function)=> {
      console.info('UIContentRouterBackNullUndefinedTest_0003 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('backEmpty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterBackNullUndefinedTest_0003' + JSON.stringify(obj.$attrs.width));
      console.info('UIContentRouterBackNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterBackNullUndefinedTest_0003 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterBackNullUndefinedTest_0004
     * @tc.number UIContentRouterBackNullUndefinedTest_0004
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterBackNullUndefinedTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('UIContentRouterBackNullUndefinedTest_0004 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('backRecoverableTrue');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterBackNullUndefinedTest_0004' + JSON.stringify(obj.$attrs.width));
      console.info('UIContentRouterBackNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterBackNullUndefinedTest_0004 END');
      done();
    });

    /**
     * @tc.name   UIContentRouterBackNullUndefinedTest_0005
     * @tc.number UIContentRouterBackNullUndefinedTest_0005
     * @tc.desc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UIContentRouterBackNullUndefinedTest_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('UIContentRouterBackNullUndefinedTest_0005 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('backRecoverableFalse');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('UIContentRouterBackNullUndefinedTest_0005' + JSON.stringify(obj.$attrs.width));
      console.info('UIContentRouterBackNullUndefinedTest_0001' + JSON.stringify(obj.$attrs.animationCurve));
      expect(obj.$attrs.width).assertContain('vp');
      console.info('UIContentRouterBackNullUndefinedTest_0005 END');
      done();
    });
  })
}
