/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';
import {describe, beforeEach,afterEach, it, expect} from 'deccjsunit/index';


describe('webJsTest', function () {

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
                });
                resolve();
            }, 500);
        });
        let clearPromise = new Promise((resolve, reject) => {
            setTimeout(() => {
                router.clear();
                resolve();
            }, 500);
        });
        await backToIndexPromise.then(() => {
            return clearPromise;
        });
    }

    /**
    * run before testcase
    */
    beforeAll(async function (done) {
        console.info('[webPropsJsTest] before each called')

        let result;
        let options = {
            uri: 'pages/web/prop/index'
        }
        try {
            result = router.push(options)
            console.info("push webProps page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push webProps page error " + JSON.stringify(result));
        }
        await sleep(4000)
        done()
    });

    /**
    * run after testcase
    */
    afterAll(async function () {
        console.info('[webPropsJsTest] after each called')
        await backToIndex();
        await sleep(1000)
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testWebComponentProp1
     * @tc.desc      ACE
     */
    it('testWebComponentProp1', 0, async function (done) {
        console.info('testWebComponentProp1 START');
        let obj = JSON.parse(globalThis.value.propsValues.webSrc);
        console.info("[web] get globalThis.value is: " + JSON.stringify(globalThis.value));
        console.info("[web] get inspector value is: " + JSON.stringify(obj));
        expect(obj.$type).assertEqual('web')
        console.info("[web] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
        expect(obj.$attrs.id).assertEqual('webSrc')
        expect(obj.$attrs.src).assertEqual('https://www.baidu.com')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0101
     * @tc.name      testWebComponentProp2
     * @tc.desc      ACE
     */
    it('testWebComponentProp2', 0, async function (done) {
        console.info('testWebComponentProp2 START');
        let obj = JSON.parse(globalThis.value.propsValues.webSrc);
        console.info("[web] get globalThis.value is: " + JSON.stringify(globalThis.value));
        console.info("[web] get inspector value is: " + JSON.stringify(obj));
        expect(obj.$type).assertEqual('web')
        console.info("[web] get inspector attrs value is: " + JSON.stringify(obj.$attrs));
        expect(obj.$attrs.id).assertEqual('webSrcNone')
        expect(obj.$attrs.src).assertEqual(undefined)
        done();
    });
});
