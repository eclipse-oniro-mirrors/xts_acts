/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import router from '@system.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';


export default function() {
    describe('aceJsTest', function() {

        async function sleep(time) {
            return new Promise((resolve, reject) => {
                setTimeout(() => {
                    resolve()
                }, time)
            }).then(() => {
                console.info(`sleep ${time} over...`)
            })
        }
        async function backToIndex() {

            router.back({ url: 'pages/index/index' });
            await sleep(2000);
            router.clear();
            sleep(1000)

        }

        beforeEach(async function() {
            console.info('aceJsTest ohosTest beforeEach start');
            await sleep(2000)
        });    

        /**
         * run after testcase
         */
        afterEach(async function() {
            console.info('[aceJsTest] after each called')
            await backToIndex();
        });

        /**
         * @tc.name   testStepperComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStepperComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/stepper/router/index'
            }
            try {
                result = router.push(options)
                console.info("push stepper page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push stepper page error " + JSON.stringify(result));
            }
            await sleep(35000);
            let pages = router.getState();
            console.info("[router.stepper] getState" + JSON.stringify(pages));
            expect("pages/stepper/router/").assertEqual(pages.path);
            done();


        });

        /**
         * @tc.name   testButtonComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testButtonComponent', Level.LEVEL0, async function(done) {
            console.info('testButtonComponent START');
            let result;
            let options = {
                uri: 'pages/button/router/index'
            }
            try {
                result = router.push(options)
                console.info("push button page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push button page error " + JSON.stringify(result));
            }
            await sleep(35000);
            let pages = router.getState();
            console.info("[router.button] getState" + JSON.stringify(pages));
            expect("pages/button/router/").assertEqual(pages.path)
            done();

        });

        /**
         * @tc.name   testInputComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0300
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputComponent', Level.LEVEL0, async function(done) {
            console.info('testButtonComponent START');
            let result;
            let options = {
                uri: 'pages/input/router/index'
            }
            try {
                result = router.push(options)
                console.info("push button page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push button page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.input] getState" + JSON.stringify(pages));
            expect("pages/input/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testSliderComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0400
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSliderComponent', Level.LEVEL0, async function(done) {
            console.info('testSliderComponent START');
            let result;
            let options = {
                uri: 'pages/slider/router/index'
            }
            try {
                result = router.push(options)
                console.info("push button page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push button page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.slider] getState" + JSON.stringify(pages));
            expect("pages/slider/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testTextComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0400
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTextComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/text/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/text/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testLabelComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0400
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testLabelComponent', Level.LEVEL0, async function(done) {
            console.info('testLabelComponent START');
            let result;
            let options = {
                uri: 'pages/label/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/label/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testMarqueeComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testMarqueeComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/marquee/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/marquee/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testDividerComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testDividerComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/divider/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/divider/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testGetImageComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGetImageComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/image/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/image/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testGetMenuComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGetMenuComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/menu/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            setTimeout(() => {
                let pages = router.getState();
                expect("pages/menu/router/").assertEqual(pages.path);
                done();
            }, 4500)


        });

        /**
         * @tc.name   testRatingComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRatingComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/rating/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/rating/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testSearchComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSearchComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/search/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(20000)
            let pages = router.getState();
            expect("pages/search/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testToolbarComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testToolbarComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/toolbar/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/toolbar/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testTextareaComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTextareaComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/textarea/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/textarea/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testSpanComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSpanComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/span/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/span/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testSwitchComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwitchComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/switch/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/switch/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testToggleComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testToggleComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/toggle/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/toggle/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testOptionComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOptionComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/option/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/option/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testOptionComponent1
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOptionComponent1', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/option/router1/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/option/router1/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testOptionComponent2
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOptionComponent2', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/option/router2/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/option/router2/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testOptionComponent3
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOptionComponent3', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/option/router3/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/option/router3/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testOptionComponent4
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOptionComponent4', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/option/router4/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(7000)
            let pages = router.getState();
            expect("pages/option/router4/").assertEqual(pages.path);
            done();
        });


        /**
         * @tc.name   testPickerComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/picker/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(9000)
            let pages = router.getState();
            expect("pages/picker/router/").assertEqual(pages.path);
            done();
        });


        /**
         * @tc.name   testPickerComponent1
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerComponent1', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/picker/router1/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(9000)
            let pages = router.getState();
            expect("pages/picker/router1/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testPickerComponent2
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerComponent2', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/picker/router2/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(15000)
            let pages = router.getState();
            expect("pages/picker/router2/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testPickerComponent3
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerComponent3', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/picker/router3/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(15000)
            let pages = router.getState();
            expect("pages/picker/router3/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testPickerComponent4
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerComponent4', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/picker/router4/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(15000)
            let pages = router.getState();
            expect("pages/picker/router4/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testPickerComponent5
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerComponent5', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/picker/router5/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(15000)
            let pages = router.getState();
            expect("pages/picker/router5/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testPickerComponent6
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerComponent6', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/picker/router6/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(15000)
            let pages = router.getState();
            expect("pages/picker/router6/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testPickerComponent7
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerComponent7', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/picker/router7/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(15000)
            let pages = router.getState();
            expect("pages/picker/router7/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testPickerComponent8
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPickerComponent8', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/picker/router8/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(15000)
            let pages = router.getState();
            expect("pages/picker/router8/").assertEqual(pages.path);
            done();
        });


        /**
         * @tc.name   testPieceComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPieceComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/piece/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(9000)
            let pages = router.getState();
            expect("pages/piece/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testPieceComponent1
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPieceComponent1', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/piece/router1/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(35000)
            let pages = router.getState();
            expect("pages/piece/router1/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testPieceComponent01
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPieceComponent01', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/piece/router01/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(35000)
            let pages = router.getState();
            expect("pages/piece/router01/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testPieceComponent2
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPieceComponent2', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/piece/router2/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(35000)
            let pages = router.getState();
            expect("pages/piece/router2/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testPieceComponent4
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPieceComponent4', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/piece/router4/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(35000)
            let pages = router.getState();
            expect("pages/piece/router4/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testPieceComponent5
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPieceComponent5', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/piece/router5/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(35000)
            let pages = router.getState();
            expect("pages/piece/router5/").assertEqual(pages.path);
            done();
        });


        /**
         * @tc.name   testPieceComponent6
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPieceComponent6', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/piece/router6/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(35000)
            let pages = router.getState();
            expect("pages/piece/router6/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testPieceComponent7
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPieceComponent7', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/piece/router7/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(35000)
            let pages = router.getState();
            expect("pages/piece/router7/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testProgressComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testProgressComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/progress/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(25000)
            let pages = router.getState();
            expect("pages/progress/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testQrcodeComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testQrcodeComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/qrcode/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(20000)
            let pages = router.getState();
            expect("pages/qrcode/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testSelectComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSelectComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/select/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            await sleep(20000)
            let pages = router.getState();
            expect("pages/select/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testBadgeComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBadgeComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/badge/router/index'
            }
            try {
                result = router.push(options)
                console.info("push badge page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push badge page error " + JSON.stringify(result));
            }
            await sleep(8000)
            let pages = router.getState();
            console.info("[router.badge] getState" + JSON.stringify(pages));
            expect("pages/badge/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testBadgeComponent1
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBadgeComponent1', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/badge/router1/index'
            }
            try {
                result = router.push(options)
                console.info("push badge page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push badge page error " + JSON.stringify(result));
            }
            await sleep(8000)
            let pages = router.getState();
            console.info("[router.badge] getState" + JSON.stringify(pages));
            expect("pages/badge/router1/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testBadgeComponent2
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBadgeComponent2', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/badge/router2/index'
            }
            try {
                result = router.push(options)
                console.info("push badge page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push badge page error " + JSON.stringify(result));
            }
            await sleep(8000)
            let pages = router.getState();
            console.info("[router.badge] getState" + JSON.stringify(pages));
            expect("pages/badge/router2/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testBadgeComponent3
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBadgeComponent3', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/badge/router3/index'
            }
            try {
                result = router.push(options)
                console.info("push badge page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push badge page error " + JSON.stringify(result));
            }
            await sleep(8000)
            let pages = router.getState();
            console.info("[router.badge] getState" + JSON.stringify(pages));
            expect("pages/badge/router3/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testBadgeComponent4
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBadgeComponent4', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/badge/router4/index'
            }
            try {
                result = router.push(options)
                console.info("push badge page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push badge page error " + JSON.stringify(result));
            }
            await sleep(8000)
            let pages = router.getState();
            console.info("[router.badge] getState" + JSON.stringify(pages));
            expect("pages/badge/router4/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testBadgeComponent5
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBadgeComponent5', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/badge/router5/index'
            }
            try {
                result = router.push(options)
                console.info("push badge page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push badge page error " + JSON.stringify(result));
            }
            await sleep(8000)
            let pages = router.getState();
            console.info("[router.badge] getState" + JSON.stringify(pages));
            expect("pages/badge/router5/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testBadgeComponent6
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBadgeComponent6', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/badge/router6/index'
            }
            try {
                result = router.push(options)
                console.info("push badge page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push badge page error " + JSON.stringify(result));
            }
            await sleep(8000)
            let pages = router.getState();
            console.info("[router.badge] getState" + JSON.stringify(pages));
            expect("pages/badge/router6/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testDialogComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testDialogComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/dialog/router/index'
            }
            try {
                result = router.push(options)
                console.info("push dialog page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push dialog page error " + JSON.stringify(result));
            }
            await sleep(8000)
            let pages = router.getState();
            console.info("[router.dialog] getState" + JSON.stringify(pages));
            expect("pages/dialog/router/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testDialogComponent1
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testDialogComponent1', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/dialog/router1/index'
            }
            try {
                result = router.push(options)
                console.info("push dialog page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push dialog page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.dialog] getState" + JSON.stringify(pages));
            expect("pages/dialog/router1/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testDialogComponent2
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testDialogComponent2', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/dialog/router2/index'
            }
            try {
                result = router.push(options)
                console.info("push dialog page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push dialog page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.dialog] getState" + JSON.stringify(pages));
            expect("pages/dialog/router2/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testDialogComponent3
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testDialogComponent3', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/dialog/router3/index'
            }
            try {
                result = router.push(options)
                console.info("push dialog page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push dialog page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.dialog] getState" + JSON.stringify(pages));
            expect("pages/dialog/router3/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testDivComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testDivComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/div/router/index'
            }
            try {
                result = router.push(options)
                console.info("push div page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push div page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.div] getState" + JSON.stringify(pages));
            expect("pages/div/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testFormComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testFormComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/form/router/index'
            }
            try {
                result = router.push(options)
                console.info("push form page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push form page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.form] getState" + JSON.stringify(pages));
            expect("pages/form/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testListComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/list/router/index'
            }
            try {
                result = router.push(options)
                console.info("push list page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push list page error " + JSON.stringify(result));
            }
            await sleep(20000)
            let pages = router.getState();
            console.info("[router.list] getState" + JSON.stringify(pages));
            expect("pages/list/router/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testListComponent1
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListComponent1', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/list/router1/index'
            }
            try {
                result = router.push(options)
                console.info("push list page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push list page error " + JSON.stringify(result));
            }
            await sleep(20000)
            let pages = router.getState();
            console.info("[router.list] getState" + JSON.stringify(pages));
            expect("pages/list/router1/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testListComponent2
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListComponent2', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/list/router2/index'
            }
            try {
                result = router.push(options)
                console.info("push list page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push list page error " + JSON.stringify(result));
            }
            await sleep(20000)
            let pages = router.getState();
            console.info("[router.list] getState" + JSON.stringify(pages));
            expect("pages/list/router2/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testListComponent3
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListComponent3', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/list/router3/index'
            }
            try {
                result = router.push(options)
                console.info("push list page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push list page error " + JSON.stringify(result));
            }
            await sleep(20000)
            let pages = router.getState();
            console.info("[router.list] getState" + JSON.stringify(pages));
            expect("pages/list/router3/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testListComponent4
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListComponent4', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/list/router4/index'
            }
            try {
                result = router.push(options)
                console.info("push list page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push list page error " + JSON.stringify(result));
            }
            await sleep(20000)
            let pages = router.getState();
            console.info("[router.list] getState" + JSON.stringify(pages));
            expect("pages/list/router4/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testListComponent5
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListComponent5', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/list/router5/index'
            }
            try {
                result = router.push(options)
                console.info("push list page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push list page error " + JSON.stringify(result));
            }
            await sleep(20000)
            let pages = router.getState();
            console.info("[router.list] getState" + JSON.stringify(pages));
            expect("pages/list/router5/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testListComponent6
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListComponent6', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/list/router6/index'
            }
            try {
                result = router.push(options)
                console.info("push list page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push list page error " + JSON.stringify(result));
            }
            await sleep(20000)
            let pages = router.getState();
            console.info("[router.list] getState" + JSON.stringify(pages));
            expect("pages/list/router6/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testListItemComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListItemComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/listItem/router/index'
            }
            try {
                result = router.push(options)
                console.info("push listItem page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push listItem page error " + JSON.stringify(result));
            }
            await sleep(9000)
            let pages = router.getState();
            console.info("[router.listItem] getState" + JSON.stringify(pages));
            expect("pages/listItem/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testListItemComponent1
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListItemComponent1', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/listItem/router1/index'
            }
            try {
                result = router.push(options)
                console.info("push listItem page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push listItem page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.listItem] getState" + JSON.stringify(pages));
            expect("pages/listItem/router1/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testListItemComponent2
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListItemComponent2', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/listItem/router2/index'
            }
            try {
                result = router.push(options)
                console.info("push listItem page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push listItem page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.listItem] getState" + JSON.stringify(pages));
            expect("pages/listItem/router2/").assertEqual(pages.path);
            done();
        });


        /**
         * @tc.name   testListItemComponent3
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListItemComponent3', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/listItem/router3/index'
            }
            try {
                result = router.push(options)
                console.info("push listItem page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push listItem page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.listItem] getState" + JSON.stringify(pages));
            expect("pages/listItem/router3/").assertEqual(pages.path);
            done();
        });


        /**
         * @tc.name   testListItemComponent4
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListItemComponent4', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/listItem/router4/index'
            }
            try {
                result = router.push(options)
                console.info("push listItem page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push listItem page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.listItem] getState" + JSON.stringify(pages));
            expect("pages/listItem/router4/").assertEqual(pages.path);
            done();
        });


        /**
         * @tc.name   testListItemComponent5
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListItemComponent5', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/listItem/router5/index'
            }
            try {
                result = router.push(options)
                console.info("push listItem page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push listItem page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.listItem] getState" + JSON.stringify(pages));
            expect("pages/listItem/router5/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testListItemComponent6
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListItemComponent6', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/listItem/router6/index'
            }
            try {
                result = router.push(options)
                console.info("push listItem page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push listItem page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.listItem] getState" + JSON.stringify(pages));
            expect("pages/listItem/router6/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testListItemComponent7
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListItemComponent7', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/listItem/router7/index'
            }
            try {
                result = router.push(options)
                console.info("push listItem page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push listItem page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.listItem] getState" + JSON.stringify(pages));
            expect("pages/listItem/router7/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testListItemComponent8
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListItemComponent8', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/listItem/router8/index'
            }
            try {
                result = router.push(options)
                console.info("push listItem page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push listItem page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.listItem] getState" + JSON.stringify(pages));
            expect("pages/listItem/router8/").assertEqual(pages.path);
            done();
        });



        /**
         * @tc.name   testListItemGroupComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListItemGroupComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/listItemGroup/router/index'
            }
            try {
                result = router.push(options)
                console.info("push listItemGroup page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push listItemGroup page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.listItemGroup] getState" + JSON.stringify(pages));
            expect("pages/listItemGroup/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testPanelComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/panel/router/index'
            }
            try {
                result = router.push(options)
                console.info("push panel page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push panel page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.panel] getState" + JSON.stringify(pages));
            expect("pages/panel/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testPopupComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPopupComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/popup/router/index'
            }
            try {
                result = router.push(options)
                console.info("push popup page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push popup page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.popup] getState" + JSON.stringify(pages));
            expect("pages/popup/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testStackComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testStackComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/stack/router/index'
            }
            try {
                result = router.push(options)
                console.info("push stack page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push stack page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.stack] getState" + JSON.stringify(pages));
            expect("pages/stack/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testSwiperComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSwiperComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/swiper/router/index'
            }
            try {
                result = router.push(options)
                console.info("push swiper page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push swiper page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.swiper] getState" + JSON.stringify(pages));
            expect("pages/swiper/router/").assertEqual(pages.path);
            done();
        });


        /**
         * @tc.name   testRefreshComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/refresh/router/index'
            }
            try {
                result = router.push(options)
                console.info("push refresh page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push refresh page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.refresh] getState" + JSON.stringify(pages));
            expect("pages/refresh/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testRefreshComponent1
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshComponent1', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/refresh/router1/index'
            }
            try {
                result = router.push(options)
                console.info("push refresh page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push refresh page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.refresh] getState" + JSON.stringify(pages));
            expect("pages/refresh/router1/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testRefreshComponent2
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshComponent2', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/refresh/router2/index'
            }
            try {
                result = router.push(options)
                console.info("push refresh page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push refresh page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.refresh] getState" + JSON.stringify(pages));
            expect("pages/refresh/router2/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testRefreshComponent3
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshComponent3', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/refresh/router3/index'
            }
            try {
                result = router.push(options)
                console.info("push refresh page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push refresh page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.refresh] getState" + JSON.stringify(pages));
            expect("pages/refresh/router3/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testRefreshComponent4
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshComponent4', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/refresh/router4/index'
            }
            try {
                result = router.push(options)
                console.info("push refresh page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push refresh page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.refresh] getState" + JSON.stringify(pages));
            expect("pages/refresh/router4/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testRefreshComponent5
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshComponent5', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/refresh/router5/index'
            }
            try {
                result = router.push(options)
                console.info("push refresh page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push refresh page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.refresh] getState" + JSON.stringify(pages));
            expect("pages/refresh/router5/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testRefreshComponent6
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshComponent6', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/refresh/router6/index'
            }
            try {
                result = router.push(options)
                console.info("push refresh page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push refresh page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.refresh] getState" + JSON.stringify(pages));
            expect("pages/refresh/router6/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testRefreshComponent7
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshComponent7', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/refresh/router7/index'
            }
            try {
                result = router.push(options)
                console.info("push refresh page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push refresh page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.refresh] getState" + JSON.stringify(pages));
            expect("pages/refresh/router7/").assertEqual(pages.path);
            done();
        });
        /**
         * @tc.name   testRefreshComponent8
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRefreshComponent8', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/refresh/router8/index'
            }
            try {
                result = router.push(options)
                console.info("push refresh page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push refresh page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.refresh] getState" + JSON.stringify(pages));
            expect("pages/refresh/router8/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testImageAnimatorComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testImageAnimatorComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/imageAnimator/router/index'
            }
            try {
                result = router.push(options)
                console.info("push imageAnimator page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push imageAnimator page error " + JSON.stringify(result));
            }
            await sleep(9000)
            let pages = router.getState();
            console.info("[router.imageAnimator] getState" + JSON.stringify(pages));
            expect("pages/imageAnimator/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testImageAnimatorComponent1
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testImageAnimatorComponent1', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/imageAnimator/router1/index'
            }
            try {
                result = router.push(options)
                console.info("push imageAnimator page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push imageAnimator page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.imageAnimator] getState" + JSON.stringify(pages));
            expect("pages/imageAnimator/router1/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testImageAnimatorComponent2
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testImageAnimatorComponent2', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/imageAnimator/router2/index'
            }
            try {
                result = router.push(options)
                console.info("push imageAnimator page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push imageAnimator page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.imageAnimator] getState" + JSON.stringify(pages));
            expect("pages/imageAnimator/router2/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testImageAnimatorComponent3
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testImageAnimatorComponent3', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/imageAnimator/router3/index'
            }
            try {
                result = router.push(options)
                console.info("push imageAnimator page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push imageAnimator page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.imageAnimator] getState" + JSON.stringify(pages));
            expect("pages/imageAnimator/router3/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testImageAnimatorComponent4
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testImageAnimatorComponent4', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/imageAnimator/router4/index'
            }
            try {
                result = router.push(options)
                console.info("push imageAnimator page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push imageAnimator page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.imageAnimator] getState" + JSON.stringify(pages));
            expect("pages/imageAnimator/router4/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testImageAnimatorComponent5
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testImageAnimatorComponent5', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/imageAnimator/router5/index'
            }
            try {
                result = router.push(options)
                console.info("push imageAnimator page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push imageAnimator page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.imageAnimator] getState" + JSON.stringify(pages));
            expect("pages/imageAnimator/router5/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testImageAnimatorComponent6
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testImageAnimatorComponent6', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/imageAnimator/router6/index'
            }
            try {
                result = router.push(options)
                console.info("push imageAnimator page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push imageAnimator page error " + JSON.stringify(result));
            }
            await sleep(35000)
            let pages = router.getState();
            console.info("[router.imageAnimator] getState" + JSON.stringify(pages));
            expect("pages/imageAnimator/router6/").assertEqual(pages.path);
            done();
        });


        /**
         * @tc.name   testTabsComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTabsComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/tabs/router/index'
            }
            try {
                result = router.push(options)
                console.info("push tabs page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push tabs page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.tabs] getState" + JSON.stringify(pages));
            expect("pages/tabs/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testTabBarComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTabBarComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/tab-bar/router/index'
            }
            try {
                result = router.push(options)
                console.info("push tab-bar page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push tab-bar page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.tab-bar] getState" + JSON.stringify(pages));
            expect("pages/tab-bar/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testTabContentComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTabContentComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/tab-content/router/index'
            }
            try {
                result = router.push(options)
                console.info("push tab-content page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push tab-content page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.tab-content] getState" + JSON.stringify(pages));
            expect("pages/tab-content/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testGridContainerComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGridContainerComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/gridContainer/router/index'
            }
            try {
                result = router.push(options)
                console.info("push gridContainer page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push gridContainer page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.gridContainer] getState" + JSON.stringify(pages));
            expect("pages/gridContainer/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testGridRowComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGridRowComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/gridRow/router/index'
            }
            try {
                result = router.push(options)
                console.info("push gridRow page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push gridRow page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.gridRow] getState" + JSON.stringify(pages));
            expect("pages/gridRow/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testGridColComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGridColComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/gridCol/router/index'
            }
            try {
                result = router.push(options)
                console.info("push gridCol page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push gridCol page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.gridCol] getState" + JSON.stringify(pages));
            expect("pages/gridCol/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testCanvasComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/canvas/router/index'
            }
            try {
                result = router.push(options)
                console.info("push canvas page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push canvas page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.canvas] getState" + JSON.stringify(pages));
            expect("pages/canvas/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testCanvasRenderingContext2DComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasRenderingContext2DComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/obj_CanvasRenderingContext2D/router/index'
            }
            try {
                result = router.push(options)
                console.info("push obj_CanvasRenderingContext2D page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push obj_CanvasRenderingContext2D page error " + JSON.stringify(result));
            }
            await sleep(15000)
            let pages = router.getState();
            console.info("[router.obj_CanvasRenderingContext2D] getState" + JSON.stringify(pages));
            expect("pages/obj_CanvasRenderingContext2D/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testObjImageComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testObjImageComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/obj_Image/router/index'
            }
            try {
                result = router.push(options)
                console.info("push obj_Image page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push obj_Image page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.obj_Image] getState" + JSON.stringify(pages));
            expect("pages/obj_Image/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testCanvasGradientComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasGradientComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/obj_CanvasGradient/router/index'
            }
            try {
                result = router.push(options)
                console.info("push obj_CanvasGradient page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push obj_CanvasGradient page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.obj_CanvasGradient] getState" + JSON.stringify(pages));
            expect("pages/obj_CanvasGradient/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testImageDataComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testImageDataComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/obj_ImageData/router/index'
            }
            try {
                result = router.push(options)
                console.info("push obj_ImageData page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push obj_ImageData page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.obj_ImageData] getState" + JSON.stringify(pages));
            expect("pages/obj_ImageData/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testPath2DComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPath2DComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/obj_Path2D/router/index'
            }
            try {
                result = router.push(options)
                console.info("push obj_Path2D page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push obj_Path2D page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.obj_Path2D] getState" + JSON.stringify(pages));
            expect("pages/obj_Path2D/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testCameraComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCameraComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/camera/router/index'
            }
            try {
                result = router.push(options)
                console.info("push camera page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push camera page error " + JSON.stringify(result));
            }
            await sleep(7000)
            let pages = router.getState();
            console.info("[router.camera] getState" + JSON.stringify(pages));
            expect("pages/camera/router/").assertEqual(pages.path);
            done();
        });

    });
}