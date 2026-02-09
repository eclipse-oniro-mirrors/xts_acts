/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { describe, beforeAll, afterAll, it, expect, Level } from '@ohos/hypium';


export default function canvasPropsJsTest() {
    describe('canvasPropsJsTest', function() {

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
            let backToIndexPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.back({
                        uri: 'pages/index/index'
                    })
                    resolve()
                }, 500)
            })
            let clearPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.clear()
                    resolve()
                }, 500)
            })
            await backToIndexPromise.then(() => {
                return clearPromise;
            })
        }

        /**
         * run before testcase
         */
        beforeAll(async function(done) {
            console.info('[canvasPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/canvas/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push canvasProps page success " + JSON.stringify(result))
            } catch (err) {
                console.error("push canvasProps page error " + JSON.stringify(result))
            }
            await sleep(4000)
            done()
        })

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[canvasPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        })

        /**
         * @tc.name   testCanvasIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasIdProp', Level.LEVEL0, async function(done) {
            console.info('testCanvasIdProp START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.idProp)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('idProp')
            done()
        })

        /**
         * @tc.name   testCanvasClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasClassProp', Level.LEVEL0, async function(done) {
            console.info('testCanvasClassProp START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.classProp)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('classProp')
            expect(obj.$attrs.className).assertEqual('classProp')
            done()
        })

        /**
         * @tc.name   testCanvasClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testCanvasClassPropNone START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.classPropNone)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[canvasProps] get className value is: " + JSON.stringify(obj.$attrs.className))
            done()
        })

        /**
         * @tc.name   testCanvasStyleProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACEs
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        //    it('testCanvasStyleProp', Level.LEVEL0, async function (done) {
        //        console.info('testCanvasStyleProp START')
        //        console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))
        //
        //        let obj = JSON.parse(globalThis.value.styleProp)
        //        console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
        //        console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))
        //
        //        expect(obj.$type).assertEqual('canvas')
        //        expect(obj.$attrs.id).assertEqual('styleProp')
        //        expect(obj.$attrs.style).assertEqual(undefined)
        //        console.info("[canvasProps] get style value is: " + JSON.stringify(obj.$attrs.style))
        //
        //        expect(obj.$styles.width).assertEqual(undefined)
        //        console.info("[canvasProps] get style width value is: " + JSON.stringify(obj.$styles.width))
        //        expect(obj.$styles.height).assertEqual(undefined)
        //        console.info("[canvasProps] get style height value is: " + JSON.stringify(obj.$styles.height))
        //        expect(obj.$styles.get('background-color')).assertEqual(undefined)
        //        done()
        //    })

        /**
         * @tc.name   testCanvasRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasRefProp', Level.LEVEL0, async function(done) {
            console.info('testCanvasRefProp START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.refProp)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done()
        })

        /**
         * @tc.name   testCanvasRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testCanvasRefPropNone START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.refPropNone)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[canvasProps] get ref value is: " + JSON.stringify(obj.$attrs.ref))
            done()
        })

        /**
         * @tc.name   testCanvasDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testCanvasDisabledPropTrue START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.disabledPropTrue)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done()
        })

        /**
         * @tc.name   testCanvasDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testCanvasDisabledPropFalse START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.disabledPropFalse)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done()
        })

        /**
         * @tc.name   testCanvasDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('testCanvasDisabledPropNone START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.disabledPropNone)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done()
        })

        /**
         * @tc.name   testCanvasFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testCanvasFocusablePropTrue START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.focusablePropTrue)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done()
        })

        /**
         * @tc.name   testCanvasFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testCanvasFocusablePropFalse START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.focusablePropFalse)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done()
        })

        /**
         * @tc.name   testCanvasFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('testCanvasFocusablePropNone START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.focusablePropNone)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done()
        })

        /**
         * @tc.name   testCanvasDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasDataProp', Level.LEVEL0, async function(done) {
            console.info('testCanvasDataProp START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.dataProp)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataCanvas).assertEqual(undefined)
            console.info("[canvasProps] get dataCanvas value is: " + JSON.stringify(obj.$attrs.dataCanvas))
            done()
        })

        /**
         * @tc.name   testCanvasDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testCanvasDataPropNone START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.dataPropNone)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataCanvas).assertEqual(undefined)
            console.info("[canvasProps] get dataCanvas value is: " + JSON.stringify(obj.$attrs.dataCanvas))
            done()
        })

        /**
         * @tc.name   testCanvasDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testCanvasDirPropRtl START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.dirPropRtl)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done()
        })

        /**
         * @tc.name   testCanvasDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testCanvasDirPropLtr START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.dirPropLtr)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done()
        })

        /**
         * @tc.name   testCanvasDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testCanvasDirPropAuto START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.dirPropAuto)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done()
        })

        /**
         * @tc.name   testCanvasDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testCanvasDirPropNone START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.dirPropNone)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done()
        })

        /**
         * @tc.name   testCanvasForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasForPropNull', Level.LEVEL0, async function(done) {
            console.info('testCanvasForPropNull START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.forPropNull)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[canvasProps] get for value is: " + JSON.stringify(obj.$attrs.for))
            done()
        })

        /**
         * @tc.name   testCanvasForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasForPropOne', Level.LEVEL0, async function(done) {
            console.info('testCanvasForPropOne START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.forPropOne)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[canvasProps] get for value is: " + JSON.stringify(obj.$attrs.for))
            done()
        })

        /**
         * @tc.name   testCanvasForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasForPropThree', Level.LEVEL0, async function(done) {
            console.info('testCanvasForPropThree START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.forPropThree)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[canvasProps] get for value is: " + JSON.stringify(obj.$attrs.for))
            done()
        })

        /**
         * @tc.name   testCanvasIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testCanvasIfPropTrue START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.ifPropTrue)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[canvasProps] get for value is: " + JSON.stringify(obj.$attrs.if))
            done()
        })

        /**
         * @tc.name   testCanvasIfPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        //    it('testCanvasIfPropFalse', Level.LEVEL0, async function (done) {
        //        console.info('testCanvasIfPropFalse START')
        //        console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))
        //
        //        let obj = JSON.parse(globalThis.value.ifPropFalse)
        //        console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
        //        console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))
        //
        //        expect(obj.$type).assertEqual('canvas')
        //        expect(obj.$attrs.id).assertEqual('ifPropFalse')
        //        expect(obj.$attrs.if).assertEqual(false)
        //        done()
        //    })

        /**
         * @tc.name   testCanvasIfPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        //    it('testCanvasIfPropNone', Level.LEVEL0, async function (done) {
        //        console.info('testCanvasIfPropNone START')
        //        console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))
        //
        //        let obj = JSON.parse(globalThis.value.ifPropNone)
        //        console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
        //        console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))
        //
        //        expect(obj.$type).assertEqual('canvas')
        //        expect(obj.$attrs.id).assertEqual('ifPropNone')
        //        expect(obj.$attrs.if).assertEqual(false)
        //        done()
        //    })

        /**
         * @tc.name   testCanvasShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testCanvasShowPropTrue START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.showPropTrue)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[canvasProps] get show value is: " + JSON.stringify(obj.$attrs.show))
            done()
        })

        /**
         * @tc.name   testCanvasShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testCanvasShowPropFalse START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.showPropFalse)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[canvasProps] get show value is: " + JSON.stringify(obj.$attrs.show))
            done()
        })

        /**
         * @tc.name   testCanvasShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasShowPropNone', Level.LEVEL0, async function(done) {
            console.info('testCanvasShowPropNone START')
            console.info("[canvasProps] get globalThis.value is: " + JSON.stringify(globalThis.value))

            let obj = JSON.parse(globalThis.value.showPropNone)
            console.info("[canvasProps] get inspector value is: " + JSON.stringify(obj))
            console.info("[canvasProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs))

            expect(obj.$type).assertEqual('canvas')
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[canvasProps] get show value is: " + JSON.stringify(obj.$attrs.show))
            done()
        })
    })
}