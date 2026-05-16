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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';

export default function blurStyleOptions() {
  describe('blurStyleOptions', () => {
    beforeEach(async (done: Function) => {
      console.info('MenuStyleOptionsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/BlurStyleOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get MenuStyleOptionsTest state pages:' + JSON.stringify(pages));
        if (!('BlurStyleOptions' === pages.name)) {
          console.info('get MenuStyleOptionsTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          const SLEEP_TIME1 = 2500;
          await Utils.sleep(SLEEP_TIME1);
          console.info('push MenuStyleOptionsTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push MenuStyleOptionsTest page error:' + err);
      }
      console.info('MenuStyleOptionsTest beforeEach end');
      done();
    });

    /**
     * @tc.name   MenuStyleOptionsTest_0101
     * @tc.number MenuStyleOptionsTest_0101
     * @tc.desc   Menu component interface backgroundBlurStyleOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MenuStyleOptionsTest_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('MenuStyleOptionsTest_0101 START');
      const SLEEP_TIME = 2000;
      await CommonFunc.sleep(SLEEP_TIME);
      sendEventByKey('MenuStyleOptions_btn1', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('MenuStyleOptionsTest_0101 click after');
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(SLEEP_TIME);
      let tree = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree())).$children.length);
      let menu: ESObject = {};
      if (tree && tree === '2') {
        menu = obj.$children[1].$children[0];
      } else {
        menu = obj.$children[0].$children[0];
      }
      let uniRenderFlag: string = menu.$attrs.uniRender;
      console.info('[MenuStyleOptionsTest_0101] uniRenderFlag is: ' + uniRenderFlag);
      if (uniRenderFlag === 'false') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[1].$children[0].$attrs.backgroundBlurStyle.options.scale);
        expect(text).assertEqual('1');
      } else if (tree && tree === '2') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[1].$children[0].$attrs.backgroundBlurStyle.options.scale);
        expect(text).assertEqual('0.1');
      } else {
        let json = JSON.stringify(getInspectorTree())
        let chunkSize = 2000;
        for (let i = 0; i < json.length; i += chunkSize) {
          console.info(json.slice(i, i + chunkSize));
        }
        let text = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0].$children[0].$attrs.backgroundBlurStyle.options.policy);
        expect(JSON.parse(text)).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      }
      sendEventByKey('MenuStyleOptions_btn1', 10, '');
      console.info('MenuStyleOptionsTest_0101 END');
      done();
    });

    /**
     * @tc.name   MenuStyleOptionsTest_0102
     * @tc.number MenuStyleOptionsTest_0102
     * @tc.desc   Menu component interface backgroundBlurStyleOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MenuStyleOptionsTest_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('MenuStyleOptionsTest_0102 START');
      const SLEEP_TIME = 2000;
      await CommonFunc.sleep(SLEEP_TIME);
      sendEventByKey('MenuStyleOptions_btn2', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('MenuStyleOptionsTest_0102 click after');
      let tree = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree())).$children.length);
      if (tree && tree === '2') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[1].$children[0].$attrs.backgroundBlurStyle.options.scale);
        expect(text).assertEqual('1');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0].$children[0].$attrs.backgroundBlurStyle.options.scale);
        expect(text).assertEqual('1');
      }
      await CommonFunc.sleep(SLEEP_TIME);
      sendEventByKey('MenuStyleOptions_btn2', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('MenuStyleOptionsTest_0102 END');
      done();
    });

    /**
     * @tc.name   MenuStyleOptionsTest_0103
     * @tc.number MenuStyleOptionsTest_0103
     * @tc.desc   Menu component interface backgroundBlurStyleOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MenuStyleOptionsTest_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('MenuStyleOptionsTest_0103 START');
      const SLEEP_TIME = 2000;
      await CommonFunc.sleep(SLEEP_TIME);
      sendEventByKey('MenuStyleOptions_btn3', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('MenuStyleOptionsTest_0103 click after');
      let tree = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree())).$children.length);
      if (tree && tree === '2') {
        let text = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[1].$children[0].$attrs.backgroundBlurStyle.options.scale);
        expect(text).assertEqual('1');
      } else {
        let text = JSON.stringify(JSON.parse(JSON.stringify(getInspectorTree()))
          .$children[0].$children[0].$attrs.backgroundBlurStyle.options.scale);
        expect(text).assertEqual('1');
      }
      await CommonFunc.sleep(SLEEP_TIME);
      sendEventByKey('MenuStyleOptions_btn3', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('MenuStyleOptionsTest_0103 END');
      done();
    });
  })
}