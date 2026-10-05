namespace dhaya.common;

type guid : String(32);

type gender : String(2) enum{
    Male = 'M';
    Female = 'F';
    Unknown = 'U';

}

type PhoneNumber : String(15);
type email : String(255);
type Currency : String(3);
type Money : Decimal(15,2);

aspect Amount {
    GROSS_AMOUNT : Decimal(15, 2);
    NET_AMOUNT   : Decimal(15,2);
    TAX_AMOUNT   : Decimal(15,2);
    CURRENCY     : Currency;
}