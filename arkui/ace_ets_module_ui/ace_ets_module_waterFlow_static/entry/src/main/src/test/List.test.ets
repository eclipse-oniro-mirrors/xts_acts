'use static';
import WaterFlowAttributeTest from './WaterFlowTest/WaterFlowAttribute.test';
import WaterFlowFuncTest from './WaterFlowAttributeTest/WaterFlowFunc.test';

export default function testsuite() {
  WaterFlowAttributeTest();
  WaterFlowFuncTest();
}