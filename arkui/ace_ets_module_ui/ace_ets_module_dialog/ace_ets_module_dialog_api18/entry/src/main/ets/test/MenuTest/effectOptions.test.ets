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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';

export default function effectOptions() {
  describe('effectOptions', () => {
    beforeEach(async (done: Function) => {
      console.info('EffectOptionsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/EffectOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get EffectOptionsTest state pages:' + JSON.stringify(pages));
        if (!('EffectOptions' == pages.name)) {
          console.info('get EffectOptionsTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push EffectOptionsTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push EffectOptionsTest page error:' + err);
      }
      console.info('EffectOptionsTest beforeEach end');
      done();
    });

    /**
     * @tc.number: EffectOptionsTest_0101
     * @tc.name  : EffectOptionsTest_0101
     * @tc.desc  : Menu component interface backgroundEffectOptions
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('EffectOptionsTest_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('EffectOptionsTest_0101 START');
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('EffectOptions_btn1'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let text = getInspectorByKey('text');
      expect(JSON.parse(text).$attrs.content).assertEqual('bindMenu1');
      await btn.click();
      await CommonFunc.sleep(1000);
      console.info('EffectOptionsTest_0101 END');
      done();
    });

    /**
     * @tc.number: EffectOptionsTest_0102
     * @tc.name  : EffectOptionsTest_0102
     * @tc.desc  : Menu component interface backgroundEffectOptions
     * @tc.level : Level 1
     * @tc.type
     * @tc.size
     */
    it('EffectOptionsTest_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('EffectOptionsTest_0102 START');
      await CommonFunc.sleep(3000);
      sendEventByKey('EffectOptions_btn2',10,"");
      await CommonFunc.sleep(3000);
      console.info('EffectOptionsTest_0102 click after');
      let tree = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree())).$children.length);
      if (tree && tree == "2") {
        let text = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[1].$children[0].$attrs.backgroundEffect.options.color)
        expect(text).assertEqual('"#00000000"');
        }else{
          let text = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0].$children[0].$attrs.backgroundEffect.options.color)
          expect(JSON.parse(text)).assertEqual('#00000000');
        }
      await CommonFunc.sleep(1000);
      sendEventByKey('EffectOptions_btn2',10,"");
      await CommonFunc.sleep(1000);
      console.info('EffectOptionsTest_0102 END');
      done();
    });

    /**
     * @tc.number: MenuStyleOptionsTest_0103
     * @tc.name  : MenuStyleOptionsTest_0103
     * @tc.desc  : Menu component interface backgroundEffectOptions
     * @tc.level : Level 2
     * @tc.type
     * @tc.size
     */
    it('EffectOptionsTest_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('EffectOptionsTest_0103 START');
      await CommonFunc.sleep(3000);
      sendEventByKey('EffectOptions_btn3',10,"");
      await CommonFunc.sleep(3000);
      console.info('EffectOptionsTest_0103 click after');
      let tree = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree())).$children.length);
      console.info('color3' + tree);
      if (tree && tree == "2") {
        let text = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[1].$children[0].$attrs.backgroundEffect.options.color)
        expect(text).assertEqual('"#00000000"');
        }else{
          let text = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0].$children[0].$attrs.backgroundEffect.options.color)
          expect(JSON.parse(text)).assertEqual('#00000000');
        }
      await CommonFunc.sleep(1000);
      sendEventByKey('EffectOptions_btn3',10,"");
      await CommonFunc.sleep(1000);
      console.info('EffectOptionsTest_0103 END');
      done();
    });
  })
}