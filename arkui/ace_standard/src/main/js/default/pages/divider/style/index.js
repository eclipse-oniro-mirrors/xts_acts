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
        styleOne : null,
        styleTwo : null,
        styleThree : null,
        styleFour : null,
        styleFive : null,
        styleSix : null,
        styleSeven : null,
        styleEight : null,
        styleNine : null,
        styleTen : null,
        styleEleven : null,
        styleTwelve : null,
        styleThirteen : null,
    },

    onShow(){
        this.getCommonStyleValues();
        globalThis.value = {
            styleOne : this.styleOne,
            styleTwo : this.styleTwo,
            styleThree : this.styleThree,
            styleFour : this.styleFour,
            styleFive : this.styleFive,
            styleSix : this.styleSix,
            styleSeven : this.styleSeven,
            styleEight : this.styleEight,
            styleNine : this.styleNine,
            styleTen : this.styleTen,
            styleEleven : this.styleEleven,
            styleTwelve : this.styleTwelve,
            styleThirteen : this.styleThirteen,
        }
    },

    getCommonStyleValues(){
        this.styleOne = this.$element("styleOne").getInspector()
        this.styleTwo = this.$element("styleTwo").getInspector()
        this.styleThree = this.$element("styleThree").getInspector()
        this.styleFour = this.$element("styleFour").getInspector()
        this.styleFive = this.$element("styleFive").getInspector()
        this.styleSix = this.$element("styleSix").getInspector()
        this.styleSeven = this.$element("styleSeven").getInspector()
        this.styleEight = this.$element("styleEight").getInspector()
        this.styleNine = this.$element("styleNine").getInspector()
        this.styleTen = this.$element("styleTen").getInspector()
        this.styleEleven = this.$element("styleEleven").getInspector()
        this.styleTwelve = this.$element("styleTwelve").getInspector()
        this.styleThirteen = this.$element("styleThirteen").getInspector()
    },
}
