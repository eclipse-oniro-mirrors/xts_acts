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

export default {
    data: {
        appData: 'localData',
        appVersion:'1.0',
    },
    functionTest1() {
        var div = this.$element('div1');
        div.scrollTo({
            id: "text12",
            duration: 200,
            timingFunction: "linear",
            complete: () => {
                console.info('scrollTo complete')
            }
        })
    },
    functionTest2() {
        var div = this.$element('div1');
        div.scrollTo({
            id: "text12",
            duration: 200,
            timingFunction: "ease",
            complete: () => {
                console.info('scrollTo complete')
            }
        })
    },
    functionTest3() {
        var div = this.$element('div1');
        div.scrollTo({
            id: "text12",
            duration: 200,
            timingFunction: "ease-in",
            complete: () => {
                console.info('scrollTo complete')
            }
        })
    },
    functionTest4() {
        var div = this.$element('div1');
        div.scrollTo({
            id: "text12",
            duration: 200,
            timingFunction: "ease-out",
            complete: () => {
                console.info('scrollTo complete')
            }
        })
    },
    functionTest5() {
        var div = this.$element('div1');
        div.scrollTo({
            id: "text12",
            duration: 200,
            timingFunction: "ease-in-out",
            complete: () => {
                console.info('scrollTo complete')
            }
        })
    },
    functionTest6() {
        var div = this.$element('div1');
        div.scrollTo({
            id: "text12",
            duration: 200,
            timingFunction: "friction",
            complete: () => {
                console.info('scrollTo complete')
            }
        })
    },
    functionTest7() {
        var div = this.$element('div1');
        div.scrollTo({
            id: "text12",
            duration: 200,
            timingFunction: "extreme-deceleration",
            complete: () => {
                console.info('scrollTo complete')
            }
        })
    },
    functionTest8() {
        var div = this.$element('div1');
        div.scrollTo({
            id: "text12",
            duration: 200,
            timingFunction: "sharp",
            complete: () => {
                console.info('scrollTo complete')
            }
        })
    },
    functionTest9() {
        var div = this.$element('div1');
        div.scrollTo({
            id: "text12",
            duration: 200,
            timingFunction: "rhythm",
            complete: () => {
                console.info('scrollTo complete')
            }
        })
    },
    functionTest10() {
        var div = this.$element('div1');
        div.scrollTo({
            id: "text12",
            duration: 200,
            timingFunction: "smooth",
            complete: () => {
                console.info('scrollTo complete')
            }
        })
    },
    functionTest11() {
        var div = this.$element('div1');
        div.scrollTo({
            id: "text12",
            duration: 200,
            timingFunction: "cubic-bezier",
            complete: () => {
                console.info('scrollTo complete')
            }
        })
    },
    functionTest12() {
        var div = this.$element('div1');
        div.scrollTo({
            id: "text12",
            duration: 200,
            timingFunction: "steps",
            complete: () => {
                console.info('scrollTo complete')
            }
        })
    }
}



