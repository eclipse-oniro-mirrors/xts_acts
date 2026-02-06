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
import {Driver} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import hilog from '@ohos.hilog';


let selectorBundleName = '';
const TAG = '[Sample_MyApp]';
const DOMAIN = 0xF811;
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function SliderOptionValue() {
	describe('SliderOptionValue', () => {

		beforeEach(async (done: Function) => {
			console.info("SliderOptionValue beforeEach start");
			let options: router.RouterOptions = {
				url: 'MainAbility/pages/Slider/slider',
			}
			try {
				router.clear();
				let pages = router.getState();
				console.info("get SliderOptionValue state pages: " + JSON.stringify(pages));
				if (!("SliderOption" == pages.name)) {
					console.info("get SliderOptionValue state pages.name: " + JSON.stringify(pages.name));
					let result = await router.pushUrl(options);
					await CommonFunc.sleep(2000);
					console.info("push SliderOptionValue page success " + JSON.stringify(result));
				}
			} catch (err) {
				console.error("push SliderOptionValue page error: " + err);
				expect().assertFail();
			}
			done()
		})


  /**
   * @tc.name   Slider_0101
   * @tc.number Slider_0101
   * @tc.desc   Slider_0101
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
		it('Slider_0101', Level.LEVEL1, async (done: Function) => {
			let driver = await Driver.create();
			let strJson = getInspectorByKey("buildTest1");
			let obj : ESObject = JSON.parse(strJson);
			console.info('Slider_0101 content:'+ JSON.stringify(obj.$attrs.content))
			expect(obj.$attrs.content).assertEqual('message1');
			done();
		})

  /**
   * @tc.name   Slider_0102
   * @tc.number Slider_0102
   * @tc.desc   Slider_0102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
		it('Slider_0102', Level.LEVEL1, async (done: Function) => {
			let driver = await Driver.create();
			let strJson = getInspectorByKey("buildTest2");
			let obj : ESObject = JSON.parse(strJson);
			console.info('Slider_0102 content:'+ JSON.stringify(obj.$attrs.content))
			expect(obj.$attrs.content).assertEqual('');
			done();
		});
  /**
   * @tc.name   Slider_0103
   * @tc.number SUB_ACE_ARKUI_SliderOptionValue_0103
   * @tc.desc   TestUpdater: Set the prefix to special text
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
		it('Slider_0103', Level.LEVEL1, async (done: Function) => {
			let driver = await Driver.create();
			let strJson = getInspectorByKey("buildTest3");
			let obj : ESObject = JSON.parse(strJson);
			console.info('Slider_0103 content:'+ JSON.stringify(obj.$attrs.content))
			expect(obj.$attrs.content).assertEqual('😎😌👨‍👩‍👦‍👦👨👨‍👩‍👦‍👦👁‍🗨123');
			done();
		});
  /**
   * @tc.name   Slider_0104
   * @tc.number SUB_ACE_ARKUI_SliderOptionValue_0104
   * @tc.desc   TestUpdater: Set the suffix to resource text
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
		it('Slider_0104', Level.LEVEL1, async (done: Function) => {
			let driver = await Driver.create();
			let strJson = getInspectorByKey("buildTest4");
			let obj : ESObject = JSON.parse(strJson);
			console.info('Slider_0104 content:'+ JSON.stringify(obj.$attrs.content))
			expect(obj.$attrs.content).assertEqual('12');
			done();
		});
  /**
   * @tc.name   Slider_0105
   * @tc.number SUB_ACE_ARKUI_SliderOptionValue_0105
   * @tc.desc   TestUpdater: Set the prefix to text
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
		it('Slider_0105', Level.LEVEL1, async (done: Function) => {
			let driver = await Driver.create();
			let strJson = getInspectorByKey("buildTest5");
			let obj : ESObject = JSON.parse(strJson);
			console.info('Slider_0105 content:'+ JSON.stringify(obj.$attrs.content))
			expect(obj.$attrs.content).assertEqual('message5');
			done();
		});
  /**
   * @tc.name   Slider_0106
   * @tc.number SUB_ACE_ARKUI_SliderOptionValue_0106
   * @tc.desc   TestUpdater: Set the suffix to text
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
		it('Slider_0106', Level.LEVEL1, async (done: Function) => {
			let driver = await Driver.create();
			let strJson = getInspectorByKey("buildTest6");
			let obj : ESObject = JSON.parse(strJson);
			console.info('Slider_0106 content:'+ JSON.stringify(obj.$attrs.content))
			expect(obj.$attrs.content).assertEqual('message6');
			done();
		});
	});
}