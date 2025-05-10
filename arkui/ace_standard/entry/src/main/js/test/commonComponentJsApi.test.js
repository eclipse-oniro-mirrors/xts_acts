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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';


export default function () {  describe('aceJsTest', function () {

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
    
        router.back({url:'pages/index/index'});
        await sleep(2000);
        router.clear();
        sleep(1000)
    
    }

    /**
    * run after testcase
    */
    afterEach(async function () {
        console.info('[aceJsTest] after each called')
        await backToIndex();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testStepperComponent
     * @tc.desc      ACE
     */
    it('testStepperComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testButtonComponent
         * @tc.desc      ACE
         */
        it('testButtonComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0300
         * @tc.name      testInputComponent
         * @tc.desc      ACE
         */
        it('testInputComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0400
         * @tc.name      testSliderComponent
         * @tc.desc      ACE
         */
        it('testSliderComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0400
         * @tc.name      testTextComponent
         * @tc.desc      ACE
         */
        it('testTextComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0400
         * @tc.name      testLabelComponent
         * @tc.desc      ACE
         */
        it('testLabelComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testMarqueeComponent
         * @tc.desc      ACE
         */
         it('testMarqueeComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testDividerComponent
         * @tc.desc      ACE
         */
        it('testDividerComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testGetImageComponent
         * @tc.desc      ACE
         */
        it('testGetImageComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testGetMenuComponent
         * @tc.desc      ACE
         */
        it('testGetMenuComponent', 0, async function (done) {
            let result;
            let options = {
                uri: 'pages/menu/router/index'
            }
            try {
                result = router.push(options)
            } catch (err) {
                result = err
            }
            setTimeout(()=>{
                let pages = router.getState();
                expect("pages/menu/router/").assertEqual(pages.path);
                done();
            },4500)
           
            
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testRatingComponent
         * @tc.desc      ACE
         */
        it('testRatingComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testSearchComponent
         * @tc.desc      ACE
         */
        it('testSearchComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testToolbarComponent
         * @tc.desc      ACE
         */
        it('testToolbarComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testTextareaComponent
         * @tc.desc      ACE
         */
        it('testTextareaComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testSpanComponent
         * @tc.desc      ACE
         */
        it('testSpanComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testSwitchComponent
         * @tc.desc      ACE
         */
        it('testSwitchComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testToggleComponent
         * @tc.desc      ACE
         */
        it('testToggleComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testOptionComponent
         * @tc.desc      ACE
         */
        it('testOptionComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testOptionComponent
         * @tc.desc      ACE
         */
           it('testOptionComponent1', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testOptionComponent2
         * @tc.desc      ACE
         */
          it('testOptionComponent2', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testOptionComponent3
         * @tc.desc      ACE
         */
           it('testOptionComponent3', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testOptionComponent4
         * @tc.desc      ACE
         */
           it('testOptionComponent4', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testPickerComponent
         * @tc.desc      ACE
         */
        it('testPickerComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testPickerComponent1
         * @tc.desc      ACE
         */
           it('testPickerComponent1', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testPickerComponent2
         * @tc.desc      ACE
         */
           it('testPickerComponent2', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testPickerComponent2
         * @tc.desc      ACE
         */
            it('testPickerComponent3', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testPickerComponent2
         * @tc.desc      ACE
         */
           it('testPickerComponent4', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testPickerComponent2
         * @tc.desc      ACE
         */
            it('testPickerComponent5', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testPickerComponent2
         * @tc.desc      ACE
         */
           it('testPickerComponent6', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testPickerComponent2
         * @tc.desc      ACE
         */
            it('testPickerComponent7', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testPickerComponent8
         * @tc.desc      ACE
         */
           it('testPickerComponent8', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testPieceComponent
         * @tc.desc      ACE
         */
           it('testPieceComponent', 0, async function (done) {
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
        
        /* @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
        * @tc.name      testPieceComponent2
        * @tc.desc      ACE
        */
         it('testPieceComponent1', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testPieceComponent01
         * @tc.desc      ACE
         */
         it('testPieceComponent01', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testPieceComponent2
         * @tc.desc      ACE
         */
          it('testPieceComponent2', 0, async function (done) {
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

        /* @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
        * @tc.name      testPieceComponent4
        * @tc.desc      ACE
        */
         it('testPieceComponent4', 0, async function (done) {
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

         /* @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
        * @tc.name      testPieceComponent5
        * @tc.desc      ACE
        */
         it('testPieceComponent5', 0, async function (done) {
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

        
         /* @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
        * @tc.name      testPieceComponent6
        * @tc.desc      ACE
        */
         it('testPieceComponent6', 0, async function (done) {
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

          /* @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
        * @tc.name      testPieceComponent7
        * @tc.desc      ACE
        */
          it('testPieceComponent7', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testProgressComponent
         * @tc.desc      ACE
         */
        it('testProgressComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testQrcodeComponent
         * @tc.desc      ACE
         */
        it('testQrcodeComponent', 0, async function (done) {
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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testSelectComponent
         * @tc.desc      ACE
         */
        it('testSelectComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testBadgeComponent
     * @tc.desc      ACE
     */
    it('testBadgeComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testBadgeComponent1
     * @tc.desc      ACE
     */
    it('testBadgeComponent1', 0, async function (done) {
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
    });/**
    * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
    * @tc.name      testBadgeComponent2
    * @tc.desc      ACE
    */
   it('testBadgeComponent2', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testBadgeComponent3
     * @tc.desc      ACE
     */
    it('testBadgeComponent3', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testBadgeComponent4
     * @tc.desc      ACE
     */
     it('testBadgeComponent4', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testBadgeComponent5
     * @tc.desc      ACE
     */
     it('testBadgeComponent5', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testBadgeComponent6
     * @tc.desc      ACE
     */
     it('testBadgeComponent6', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testDialogComponent
     * @tc.desc      ACE
     */
    it('testDialogComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testDialogComponent1
     * @tc.desc      ACE
     */
     it('testDialogComponent1', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testDialogComponent2
     * @tc.desc      ACE
     */
      it('testDialogComponent2', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testDialogComponent3
     * @tc.desc      ACE
     */
     it('testDialogComponent3', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testDivComponent
     * @tc.desc      ACE
     */
    it('testDivComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testFormComponent
     * @tc.desc      ACE
     */
    it('testFormComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListComponent
     * @tc.desc      ACE
     */
    it('testListComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListComponent1
     * @tc.desc      ACE
     */
      it('testListComponent1', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListComponent2
     * @tc.desc      ACE
     */
      it('testListComponent2', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListComponent3
     * @tc.desc      ACE
     */
      it('testListComponent3', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListComponent4
     * @tc.desc      ACE
     */
      it('testListComponent4', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListComponent5
     * @tc.desc      ACE
     */
      it('testListComponent5', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListComponent6
     * @tc.desc      ACE
     */
      it('testListComponent6', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListItemComponent
     * @tc.desc      ACE
     */
    it('testListItemComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListItemComponent
     * @tc.desc      ACE
     */
    it('testListItemComponent1', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListItemComponent
     * @tc.desc      ACE
     */
     it('testListItemComponent2', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListItemComponent
     * @tc.desc      ACE
     */
         it('testListItemComponent3', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListItemComponent
     * @tc.desc      ACE
     */
        it('testListItemComponent4', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListItemComponent5
     * @tc.desc      ACE
     */
     it('testListItemComponent5', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListItemComponent6
     * @tc.desc      ACE
     */
       it('testListItemComponent6', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListItemComponent7
     * @tc.desc      ACE
     */
     it('testListItemComponent7', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListItemComponent8
     * @tc.desc      ACE
     */
     it('testListItemComponent8', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testListItemGroupComponent
     * @tc.desc      ACE
     */
    it('testListItemGroupComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testPanelComponent
     * @tc.desc      ACE
     */
    it('testPanelComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testPopupComponent
     * @tc.desc      ACE
     */
    it('testPopupComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testStackComponent
     * @tc.desc      ACE
     */
    it('testStackComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testSwiperComponent
     * @tc.desc      ACE
     */
    it('testSwiperComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testRefreshComponent
     * @tc.desc      ACE
     */
    it('testRefreshComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testRefreshComponent1
     * @tc.desc      ACE
     */
      it('testRefreshComponent1', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testRefreshComponent2
     * @tc.desc      ACE
     */
      it('testRefreshComponent2', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testRefreshComponent
     * @tc.desc      ACE
     */
      it('testRefreshComponent3', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testRefreshComponent
     * @tc.desc      ACE
     */
      it('testRefreshComponent4', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testRefreshComponent
     * @tc.desc      ACE
     */
      it('testRefreshComponent5', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testRefreshComponent6
     * @tc.desc      ACE
     */
      it('testRefreshComponent6', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testRefreshComponent
     * @tc.desc      ACE
     */
      it('testRefreshComponent7', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testRefreshComponent8
     * @tc.desc      ACE
     */
      it('testRefreshComponent8', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testImageAnimatorComponent
     * @tc.desc      ACE
     */
    it('testImageAnimatorComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testImageAnimatorComponent1
     * @tc.desc      ACE
     */
      it('testImageAnimatorComponent1', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testImageAnimatorComponent2
     * @tc.desc      ACE
     */
          it('testImageAnimatorComponent2', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testImageAnimatorComponent3
     * @tc.desc      ACE
     */
        it('testImageAnimatorComponent3', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testImageAnimatorComponent4
     * @tc.desc      ACE
     */
         it('testImageAnimatorComponent4', 0, async function (done) {
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
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testImageAnimatorComponent5
     * @tc.desc      ACE
     */
           it('testImageAnimatorComponent5', 0, async function (done) {
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
      * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testImageAnimatorComponent6
     * @tc.desc      ACE
     */
       it('testImageAnimatorComponent6', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testTabsComponent
     * @tc.desc      ACE
     */
    it('testTabsComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testTabBarComponent
     * @tc.desc      ACE
     */
    it('testTabBarComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testTabContentComponent
     * @tc.desc      ACE
     */
    it('testTabContentComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testGridContainerComponent
     * @tc.desc      ACE
     */
    it('testGridContainerComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testGridRowComponent
     * @tc.desc      ACE
     */
    it('testGridRowComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testGridColComponent
     * @tc.desc      ACE
     */
    it('testGridColComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCanvasComponent
     * @tc.desc      ACE
     */
    it('testCanvasComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCanvasRenderingContext2DComponent
     * @tc.desc      ACE
     */
    it('testCanvasRenderingContext2DComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testObjImageComponent
     * @tc.desc      ACE
     */
    it('testObjImageComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCanvasGradientComponent
     * @tc.desc      ACE
     */
    it('testCanvasGradientComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testImageDataComponent
     * @tc.desc      ACE
     */
    it('testImageDataComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testPath2DComponent
     * @tc.desc      ACE
     */
    it('testPath2DComponent', 0, async function (done) {
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
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraComponent
     * @tc.desc      ACE
     */
    it('testCameraComponent', 0, async function (done) {
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
  

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testWebComponent
     * @tc.desc      ACE
     */
    it('testWebComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/web/router/index'
        }
        try {
            result = router.push(options)
            console.info("push web page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push web page error " + JSON.stringify(result));
        }
        await sleep(7000)
        let pages = router.getState();
        console.info("[router.web] getState" + JSON.stringify(pages));
        expect("pages/web/router/").assertEqual(pages.path);
        done();
    });

});
}
