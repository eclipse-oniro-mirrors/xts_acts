import globalStageTest from './GlobalStageStatic.test'
import FivePointOne_resMgrStageTest from './FivePointOneResMgrStageStatic.test'
import i18nStageTest from './I18nStageStatic.test'
export default function testsuite() {
    globalStageTest();
    FivePointOne_resMgrStageTest();
    i18nStageTest();
}
