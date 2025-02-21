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
        styleFourteen : null,
        styleFifteen : null,
        styleSixteen : null,
        styleSeventeen : null,
        styleEighteen : null,
        styleNineteen : null,
        styleTwenty : null,
        styleTwentyOne : null,
        styleTwentyTwo : null,
        styleTwentyThree : null,
        styleTwentyFour : null,
        styleTwentyFive : null,
        styleTwentySix : null,
        styleTwentySeven : null,
        styleTwentyNine : null,
        styleThirty : null,
        styleThirtyOne : null,
        styleThirtyTwo : null,
        specificOne1 : null,
        specificOne2 : null,
        specificTwo1 : null,
        specificTwo2 : null,
        specificThree1 : null,
        specificThree2 : null,
        specificFour1 : null,
        specificFour2 : null,
        specificFour3 : null,
        specificFour4 : null,
        specificFive1 : null,
        specificFive2 : null,
        specificSix1 : null,
        specificSix2 : null
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
            styleFourteen : this.styleFourteen,
            styleFifteen : this.styleFifteen,
            styleSixteen : this.styleSixteen,
            styleSeventeen : this.styleSeventeen,
            styleEighteen : this.styleEighteen,
            styleNineteen : this.styleNineteen,
            styleTwenty : this.styleTwenty,
            styleTwentyOne : this.styleTwentyOne,
            styleTwentyTwo : this.styleTwentyTwo,
            styleTwentyThree : this.styleTwentyThree,
            styleTwentyFour : this.styleTwentyFour,
            styleTwentyFive : this.styleTwentyFive,
            styleTwentySix : this.styleTwentySix,
            styleTwentySeven : this.styleTwentySeven,
            styleTwentyNine : this.styleTwentyNine,
            styleThirty : this.styleThirty,
            styleThirtyOne : this.styleThirtyOne,
            styleThirtyTwo : this.styleThirtyTwo,
            specificOne1 : this.specificOne1,
            specificOne2 : this.specificOne2,
            specificTwo1 : this.specificTwo1,
            specificTwo2 : this.specificTwo2,
            specificThree1 : this.specificThree1,
            specificThree2 : this.specificThree2,
            specificFour1 : this.specificFour1,
            specificFour2 : this.specificFour2,
            specificFour3 : this.specificFour3,
            specificFour4 : this.specificFour4,
            specificFive1 : this.specificFive1,
            specificFive2 : this.specificFive2,
            specificSix1 : this.specificSix1,
            specificSix2 : this.specificSix2
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
        this.styleFourteen = this.$element("styleFourteen").getInspector()
        this.styleFifteen = this.$element("styleFifteen").getInspector()
        this.styleSixteen = this.$element("styleSixteen").getInspector()
        this.styleSeventeen = this.$element("styleSeventeen").getInspector()
        this.styleEighteen = this.$element("styleEighteen").getInspector()
        this.styleNineteen = this.$element("styleNineteen").getInspector()
        this.styleTwenty = this.$element("styleTwenty").getInspector()
        this.styleTwentyOne = this.$element("styleTwentyOne").getInspector()
        this.styleTwentyTwo = this.$element("styleTwentyTwo").getInspector()
        this.styleTwentyThree = this.$element("styleTwentyThree").getInspector()
        this.styleTwentyFour = this.$element("styleTwentyFour").getInspector()
        this.styleTwentyFive = this.$element("styleTwentyFive").getInspector()
        this.styleTwentySix = this.$element("styleTwentySix").getInspector()
        this.styleTwentySeven = this.$element("styleTwentySeven").getInspector()
        this.styleTwentyNine = this.$element("styleTwentyNine").getInspector()
        this.styleThirty = this.$element("styleThirty").getInspector()
        this.styleThirtyOne = this.$element("styleThirtyOne").getInspector()
        this.styleThirtyTwo = this.$element("styleThirtyTwo").getInspector()
        this.specificOne1 = this.$element("specificOne1").getInspector()
        this.specificOne2 = this.$element("specificOne2").getInspector()
        this.specificTwo1 = this.$element("specificTwo1").getInspector()
        this.specificTwo2 = this.$element("specificTwo2").getInspector()
        this.specificThree1 = this.$element("specificThree1").getInspector()
        this.specificThree2 = this.$element("specificThree2").getInspector()
        this.specificFour1 = this.$element("specificFour1").getInspector()
        this.specificFour2 = this.$element("specificFour2").getInspector()
        this.specificFour3 = this.$element("specificFour3").getInspector()
        this.specificFour4 = this.$element("specificFour4").getInspector()
        this.specificFive1 = this.$element("specificFive1").getInspector()
        this.specificFive2 = this.$element("specificFive2").getInspector()
        this.specificSix1 = this.$element("specificSix1").getInspector()
        this.specificSix2 = this.$element("specificSix2").getInspector()
    },
}
