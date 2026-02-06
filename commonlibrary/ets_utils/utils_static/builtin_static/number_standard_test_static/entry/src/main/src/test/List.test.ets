import BuiltinsNumberConstructorTest from "./Number001.test";
import BuiltinsNumberIsFiniteTest from "./Number002.test";
import BuiltinsNumberIsIntegerTest from "./Number003.test";
import BuiltinsNumberIsNaNTest from "./Number004.test";
import BuiltinsNumberIsSafeIntegerTest from "./Number008.test";
import BuiltinsNumberParseTest from "./Number007.test";
import BuiltinsNumberPropertyTest from "./Number006.test";
import BuiltinsNumberPrototypeTest from "./Number005.test";
import BuiltinsToLocaleStringTest from "./LocalString001.test";
import BuiltinsToStringTest from "./ToString001.test";
import BuiltinsValueOfTest from "./ValueOf001.test";
import ArrayTest from "./Array.test";

export default function testsuite() {
  BuiltinsNumberConstructorTest();   
  BuiltinsNumberIsFiniteTest();      
  BuiltinsNumberIsIntegerTest();    
  BuiltinsNumberIsNaNTest();
  BuiltinsNumberIsSafeIntegerTest();
  BuiltinsNumberParseTest();
  BuiltinsNumberPrototypeTest();
  BuiltinsNumberPropertyTest();
  BuiltinsToLocaleStringTest();
  BuiltinsToStringTest();
  BuiltinsValueOfTest();
  ArrayTest();
}
