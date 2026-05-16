/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY} from '@ohos.UiTest';

export default function TabsAttributeNullUndefined() {
  describe('TabsAttributeNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("TabsAttributeNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabsNullUndefined/TabsAttributeNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TabsAttributeNullUndefined state pages:" + JSON.stringify(pages));
        if (!("TabsAttributeNullUndefined" == pages.name)) {
          console.info("get TabsAttributeNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TabsAttributeNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabsAttributeNullUndefined page error:" + err);
      }
      console.info("TabsAttributeNullUndefined beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TabsAttributeNullUndefined after each called");
    });

    /**
     * @tc.number    TabsAttributeNullUndefined_0100
     * @tc.name      TabsAttributeNullUndefined_0100
     * @tc.desc      test TabsAttributeNullUndefined_0100
     * @tc.level     Level 1
     * @tc.type
     */
    it('TabsAttributeNullUndefined_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[TabsAttributeNullUndefined_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJsondefault = getInspectorByKey('tabs0Id');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info('[TabsAttribute_0100] default barMode: ' + objdefault.$attrs.barMode);
      console.info('[TabsAttribute_0100] default barWidth: ' + objdefault.$attrs.barWidth);
      console.info('[TabsAttribute_0100] default barHeight: ' + objdefault.$attrs.barHeight);
      console.info('[TabsAttribute_0100] default animationCurve: ' + objdefault.$attrs.animationCurve);
      console.info('[TabsAttribute_0100] default animationDuration: ' + objdefault.$attrs.animationDuration);
      console.info('[TabsAttribute_0100] default animationMode: ' + objdefault.$attrs.animationMode);
      console.info('[TabsAttribute_0100] default edgeEffect: ' + objdefault.$attrs.edgeEffect);
      console.info('[TabsAttribute_0100] default divider: ' + JSON.stringify(objdefault.$attrs.divider));
      console.info('[TabsAttribute_0100] default barBackgroundColor: ' + objdefault.$attrs.barBackgroundColor);
      console.info('[TabsAttribute_0100] default barGridAlign: ' + JSON.stringify(objdefault.$attrs.barGridAlign));
      console.info('[TabsAttribute_0100] default pageFlipMode: ' + objdefault.$attrs.pageFlipMode);
      console.info('[TabsAttribute_0100] default barBackgroundEffect: ' + JSON.stringify(objdefault.$attrs.barBackgroundEffect));
      console.info('[TabsAttribute_0100] default cachedMaxCount: ' + objdefault.$attrs.cachedMaxCount);
      console.info('[TabsAttribute_0100] default onContentDidScroll: ' + objdefault.$attrs.onContentDidScroll);

      let strJson1 = getInspectorByKey('tabs1Id');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[TabsAttributeNullUndefined_0100] obj1 barMode: ' + obj1.$attrs.barMode);
      console.info('[TabsAttributeNullUndefined_0100] obj1 barWidth: ' + obj1.$attrs.barWidth);
      console.info('[TabsAttributeNullUndefined_0100] obj1 barHeight: ' + obj1.$attrs.barHeight);
      console.info('[TabsAttributeNullUndefined_0100] obj1 animationCurve: ' + obj1.$attrs.animationCurve);
      console.info('[TabsAttributeNullUndefined_0100] obj1 animationDuration: ' + obj1.$attrs.animationDuration);
      console.info('[TabsAttributeNullUndefined_0100] obj1 animationMode: ' + obj1.$attrs.animationMode);
      console.info('[TabsAttributeNullUndefined_0100] obj1 edgeEffect: ' + obj1.$attrs.edgeEffect);
      console.info('[TabsAttributeNullUndefined_0100] obj1 divider: ' + JSON.stringify(obj1.$attrs.divider));
      console.info('[TabsAttributeNullUndefined_0100] obj1 barBackgroundColor: ' + obj1.$attrs.barBackgroundColor);
      console.info('[TabsAttributeNullUndefined_0100] obj1 barGridAlign: ' + JSON.stringify(obj1.$attrs.barGridAlign));
      console.info('[TabsAttributeNullUndefined_0100] obj1 pageFlipMode: ' + obj1.$attrs.pageFlipMode);
      console.info('[TabsAttributeNullUndefined_0100] obj1 barBackgroundEffect: '
         + JSON.stringify(obj1.$attrs.barBackgroundEffect));
      console.info('[TabsAttributeNullUndefined_0100] obj1 cachedMaxCount: ' + obj1.$attrs.cachedMaxCount);
      console.info('[TabsAttributeNullUndefined_0100] obj1 onContentDidScroll: ' + obj1.$attrs.onContentDidScroll);


      expect(objdefault.$attrs.barMode).assertEqual(obj1.$attrs.barMode);
      expect(objdefault.$attrs.barWidth).assertEqual(obj1.$attrs.barWidth);
      expect(objdefault.$attrs.barHeight).assertEqual(obj1.$attrs.barHeight);
      expect(objdefault.$attrs.animationCurve).assertEqual(obj1.$attrs.animationCurve);
      expect(objdefault.$attrs.animationDuration).assertEqual(obj1.$attrs.animationDuration);
      expect(objdefault.$attrs.animationMode).assertEqual(obj1.$attrs.animationMode);
      expect(objdefault.$attrs.edgeEffect).assertEqual(obj1.$attrs.edgeEffect);
      expect(objdefault.$attrs.barBackgroundColor).assertEqual(obj1.$attrs.barBackgroundColor);
      expect(JSON.stringify(objdefault.$attrs.barGridAlign)).assertEqual(JSON.stringify(obj1.$attrs.barGridAlign));
      expect(objdefault.$attrs.pageFlipMode).assertEqual(obj1.$attrs.pageFlipMode);
      expect(objdefault.$attrs.barBackgroundEffect?.adaptiveColor)
        .assertEqual(obj1.$attrs.barBackgroundEffect?.adaptiveColor);
      expect(objdefault.$attrs.cachedMaxCount).assertEqual(obj1.$attrs.cachedMaxCount);
      expect(objdefault.$attrs.onContentDidScroll).assertEqual(obj1.$attrs.onContentDidScroll);
      console.info('[TabsAttributeNullUndefined_0100] END');
      done();
    });

    /**
     * @tc.number    TabsAttributeNullUndefined_0200
     * @tc.name      TabsAttributeNullUndefined_0200
     * @tc.desc      test TabsAttributeNullUndefined_0200
     * @tc.level     Level 1
     * @tc.type
     */
    it('TabsAttributeNullUndefined_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[TabsAttributeNullUndefined_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJsondefault = getInspectorByKey('tabs0Id');
      let objdefault: ESObject = JSON.parse(strJsondefault);
      console.info('[TabsAttribute_0200] default barMode: ' + objdefault.$attrs.barMode);
      console.info('[TabsAttribute_0200] default barWidth: ' + objdefault.$attrs.barWidth);
      console.info('[TabsAttribute_0200] default barHeight: ' + objdefault.$attrs.barHeight);
      console.info('[TabsAttribute_0200] default animationCurve: ' + objdefault.$attrs.animationCurve);
      console.info('[TabsAttribute_0200] default animationDuration: ' + objdefault.$attrs.animationDuration);
      console.info('[TabsAttribute_0200] default animationMode: ' + objdefault.$attrs.animationMode);
      console.info('[TabsAttribute_0200] default edgeEffect: ' + objdefault.$attrs.edgeEffect);
      console.info('[TabsAttribute_0200] default barBackgroundColor: ' + objdefault.$attrs.barBackgroundColor);
      console.info('[TabsAttribute_0200] default barGridAlign: ' + JSON.stringify(objdefault.$attrs.barGridAlign));
      console.info('[TabsAttribute_0200] default pageFlipMode: ' + objdefault.$attrs.pageFlipMode);
      console.info('[TabsAttribute_0200] default barBackgroundEffect: '
         + JSON.stringify(objdefault.$attrs.barBackgroundEffect));
      console.info('[TabsAttribute_0200] default cachedMaxCount: ' + objdefault.$attrs.cachedMaxCount);
      console.info('[TabsAttribute_0200] default onContentDidScroll: ' + objdefault.$attrs.onContentDidScroll);

      let strJson1 = getInspectorByKey('tabs2Id');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[TabsAttributeNullUndefined_0200] obj1 barMode: ' + obj1.$attrs.barMode);
      console.info('[TabsAttributeNullUndefined_0200] obj1 barWidth: ' + obj1.$attrs.barWidth);
      console.info('[TabsAttributeNullUndefined_0200] obj1 barHeight: ' + obj1.$attrs.barHeight);
      console.info('[TabsAttributeNullUndefined_0200] obj1 animationCurve: ' + obj1.$attrs.animationCurve);
      console.info('[TabsAttributeNullUndefined_0200] obj1 animationDuration: ' + obj1.$attrs.animationDuration);
      console.info('[TabsAttributeNullUndefined_0200] obj1 animationMode: ' + obj1.$attrs.animationMode);
      console.info('[TabsAttributeNullUndefined_0200] obj1 edgeEffect: ' + obj1.$attrs.edgeEffect);
      console.info('[TabsAttributeNullUndefined_0200] obj1 divider: ' + JSON.stringify(obj1.$attrs.divider));
      console.info('[TabsAttributeNullUndefined_0200] obj1 barBackgroundColor: ' + obj1.$attrs.barBackgroundColor);
      console.info('[TabsAttributeNullUndefined_0200] obj1 barGridAlign: ' + JSON.stringify(obj1.$attrs.barGridAlign));
      console.info('[TabsAttributeNullUndefined_0200] obj1 pageFlipMode: ' + obj1.$attrs.pageFlipMode);
      console.info('[TabsAttributeNullUndefined_0200] obj1 barBackgroundEffect: '
        + JSON.stringify(obj1.$attrs.barBackgroundEffect));
      console.info('[TabsAttributeNullUndefined_0200] obj1 cachedMaxCount: ' + obj1.$attrs.cachedMaxCount);
      console.info('[TabsAttributeNullUndefined_0200] obj1 onContentDidScroll: ' + obj1.$attrs.onContentDidScroll);


      expect(objdefault.$attrs.barMode).assertEqual(obj1.$attrs.barMode);
      expect(objdefault.$attrs.barWidth).assertEqual(obj1.$attrs.barWidth);
      expect(objdefault.$attrs.barHeight).assertEqual(obj1.$attrs.barHeight);
      expect(objdefault.$attrs.animationCurve).assertEqual(obj1.$attrs.animationCurve);
      expect(objdefault.$attrs.animationDuration).assertEqual(obj1.$attrs.animationDuration);
      expect(objdefault.$attrs.animationMode).assertEqual(obj1.$attrs.animationMode);
      expect(objdefault.$attrs.edgeEffect).assertEqual(obj1.$attrs.edgeEffect);
      expect(objdefault.$attrs.barBackgroundColor).assertEqual(obj1.$attrs.barBackgroundColor);
      expect(JSON.stringify(objdefault.$attrs.barGridAlign)).assertEqual(JSON.stringify(obj1.$attrs.barGridAlign));
      expect(objdefault.$attrs.pageFlipMode).assertEqual(obj1.$attrs.pageFlipMode);
      expect(objdefault.$attrs.barBackgroundEffect?.adaptiveColor)
        .assertEqual(obj1.$attrs.barBackgroundEffect?.adaptiveColor);
      expect(objdefault.$attrs.cachedMaxCount).assertEqual(obj1.$attrs.cachedMaxCount);
      expect(objdefault.$attrs.onContentDidScroll).assertEqual(obj1.$attrs.onContentDidScroll);
      console.info('[TabsAttributeNullUndefined_0200] END');
      done();
    });

  })
}
