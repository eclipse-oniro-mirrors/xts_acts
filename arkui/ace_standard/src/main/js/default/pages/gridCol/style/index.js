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

        addOne : null,
        addTwo : null,
        addThree : null,
        addFour : null,
        addFive : null,
        addSix : null,
        addSeven : null,
        addEight : null,
        addNine : null,
        addTen : null,
        addEleven : null,
        addTwelve : null,
        addThirteen : null,
        addFourteen : null,
        addFifteen : null,
        addSixteen : null,
        addSeventeen : null,
        addEighteen : null
    },

    onShow(){
        this.getCommonStyleValuesOne();
        this.getCommonStyleValuesTwo()
        globalThis.value = {
            styleOne : this.styleOne, styleTwo : this.styleTwo,
            styleThree : this.styleThree, styleFour : this.styleFour,
            styleFive : this.styleFive, styleSix : this.styleSix,
            styleSeven : this.styleSeven, styleEight : this.styleEight,
            styleNine : this.styleNine, styleTen : this.styleTen,
            styleEleven : this.styleEleven, styleTwelve : this.styleTwelve,
            styleThirteen : this.styleThirteen, styleFourteen : this.styleFourteen,
            styleFifteen : this.styleFifteen, styleSixteen : this.styleSixteen,
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

            addOne : this.addOne, addTwo : this.addTwo,
            addThree : this.addThree, addFour : this.addFour,
            addFive : this.addFive, addSix : this.addSix,
            addSeven : this.addSeven, addEight : this.addEight,
            addNine : this.addNine, addTen : this.addTen,
            addEleven : this.addEleven, addTwelve : this.addTwelve,
            addThirteen : this.addThirteen, addFourteen : this.addFourteen,
            addFifteen : this.addFifteen, addSixteen : this.addSixteen,
            addSeventeen : this.addSeventeen, addEighteen : this.addEighteen
        }
    },

    getCommonStyleValuesOne(){
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
    },

    getCommonStyleValuesTwo(){
        this.addOne = this.$element("addOne").getInspector()
        this.addTwo = this.$element("addTwo").getInspector()
        this.addThree = this.$element("addThree").getInspector()
        this.addFour = this.$element("addFour").getInspector()
        this.addFive = this.$element("addFive").getInspector()
        this.addSix = this.$element("addSix").getInspector()
        this.addSeven = this.$element("addSeven").getInspector()
        this.addEight = this.$element("addEight").getInspector()
        this.addNine = this.$element("addNine").getInspector()
        this.addTen = this.$element("addTen").getInspector()
        this.addEleven = this.$element("addEleven").getInspector()
        this.addTwelve = this.$element("addTwelve").getInspector()
        this.addThirteen = this.$element("addThirteen").getInspector()
        this.addFourteen = this.$element("addFourteen").getInspector()
        this.addFifteen = this.$element("addFifteen").getInspector()
        this.addSixteen = this.$element("addSixteen").getInspector()
        this.addSeventeen = this.$element("addSeventeen").getInspector()
        this.addEighteen = this.$element("addEighteen").getInspector()
    },
}
