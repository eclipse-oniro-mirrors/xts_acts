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
    data:{
        specificOne1 : null,
        specificOne2 : null,
        specificTwo1 : null,
        specificTwo2 : null,
        specificThree1 : null,
        specificThree2 : null,
        specificFour1 : null,
        specificFour2 : null,
        specificFive1 : null,
        specificFive2 : null,
        specificSix1 : null,
        specificSix2 : null,
        specificSeven1 : null,
        specificSeven2 : null
    },

    onShow(){
        this.getCommonStyleValues();
        globalThis.value = {
            specificOne1 : this.specificOne1,
            specificOne2 : this.specificOne2,
            specificTwo1 : this.specificTwo1,
            specificTwo2 : this.specificTwo2,
            specificThree1 : this.specificThree1,
            specificThree2 : this.specificThree2,
            specificFour1 : this.specificFour1,
            specificFour2 : this.specificFour2,
            specificFive1 : this.specificFive1,
            specificFive2 : this.specificFive2,
            specificSix1 : this.specificSix1,
            specificSix2 : this.specificSix2,
            specificSeven1 : this.specificSeven1,
            specificSeven2 : this.specificSeven2
        }
    },

    getCommonStyleValues(){
        this.specificOne1 = this.$element("specificOne1").getInspector()
        this.specificOne2 = this.$element("specificOne2").getInspector()
        this.specificTwo1 = this.$element("specificTwo1").getInspector()
        this.specificTwo2 = this.$element("specificTwo2").getInspector()
        this.specificThree1 = this.$element("specificThree1").getInspector()
        this.specificThree2 = this.$element("specificThree2").getInspector()
        this.specificFour1 = this.$element("specificFour1").getInspector()
        this.specificFour2 = this.$element("specificFour2").getInspector()
        this.specificFive1 = this.$element("specificFive1").getInspector()
        this.specificFive2 = this.$element("specificFive2").getInspector()
        this.specificSix1 = this.$element("specificSix1").getInspector()
        this.specificSix2 = this.$element("specificSix2").getInspector()
        this.specificSeven1 = this.$element("specificSeven1").getInspector()
        this.specificSeven2 = this.$element("specificSeven2").getInspector()
    },
}
