/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import { Driver } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

interface optionsObj {
  uri: string
}

export default function ChipOnClose() {
    describe('ChipOnClick', () => {
        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(async (done: Function) => {
            console.info("search_caret beforeEach start");
            let options: optionsObj = {
                uri: 'MainAbility/pages/Chip/ChipOnClick',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get ChipOnClick state pages: " + JSON.stringify(pages));
                if (!("ChipOnClick" == pages.name)) {
                    console.info("get ChipOnClick state pages.name: " + JSON.stringify(pages.name));
                    let result = await router.push(options);
                    await CommonFunc.sleep(2000);
                    console.info("push ChipOnClick page result: " + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push ChipOnClick page error: " + err);
                expect().assertFail();
            }
            done();
        });
        afterEach(async () => {
            console.info("afterEach case");
        });

        afterAll(async () => {
            console.info("afterAll case");
        });

        /**
         * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_CHIP_ONCLICK_0100
         * @tc.name  : test chip onClicked
         * @tc.desc  : onClicked
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : Level 0
         */
        it('ChipOnClick_001', 0, async (done: Function) => {
            console.info('ChipOnClick_001 START');
            let ChipActionCol = CommonFunc.getComponentRect('ChipOnClick');
            await CommonFunc.sleep(200);
            let left = ChipActionCol.left + vp2px(18);
            let top = ChipActionCol.top + vp2px(18);
            await CommonFunc.sleep(200);
            console.info('ChipOnClick_001 left' + left + 'top:' + top);
            let driver = Driver.create();
            await driver.click(Math.round(left + globalThis.winLeft), Math.round(globalThis.winTop + top));
            await CommonFunc.sleep(1000);
            console.info('ChipOnClick_001 click success');

            let strJson1 = getInspectorByKey('ChipOnClickText');
            let obj2: Record<string, ESObject> = JSON.parse(strJson1);
            await CommonFunc.sleep(1000);
            console.info("[ChipOnClick_001] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
            expect(obj2.$attrs.content).assertEqual('onClicked');
            console.info('[ChipOnClick_001] END');
            done();
        });
    })
}
