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
        title: "",
        watchVal:"123",
        Version:"1.0"
    },
    onInit() {
        this.$watch("watchVal", "onwatch")
    },
    functionTest1() {
        var function1 = this.$element('function1');
        var result = function1.setStyle("font-size", "50px")
        console.info('setStyle result is ' + result)
    },
    functionTest2() {
        var function2 = this.$element('function2');
        function2.setAttribute("type", "password")
    },
    functionTest3() {
        var elem = dom.createElement("button");
        elem.setAttribute("value", "buttoncreateElement");
        var testDiv = this.$element('testDiv');
        testDiv.addChild(elem);
    },
    functionTest4() {
        var function2 = this.$element('function2');
        function2.rotation({
            focus: true
        })
    },
    functionTest5() {
        //将watchVal从123改为456，触发onwatch事件
        this.watchVal = "456"
    },
    functionTest6() {
        this.$set('Version', 2);
        console.info("Version = " + this.Version);
        this.$delete('Version');
        // log print:Version = undefined
        console.info("Version = " + this.Version);
    },
    functionTest7() {
        this.$tc('Version', 2);
        console.info("Version = " + this.Version);
        this.$delete('Version');
        // log print:Version = undefined
        console.info("Version = " + this.Version);
    },
    onwatch(newVal, oldVal) {
        console.log("watch newVal = " + newVal + ",oldVal =" + oldVal)
    },
   
}



