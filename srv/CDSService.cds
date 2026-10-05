using{dhaya.cds.CDSViews as views} from '../db/CDSViews';

service CDSService @(path:'CDSService'){

    entity ProductSet as projection on views.ProductView{

        *,

        //never persisted in db
        virtual soldCount : Int16
    };

    entity ItemsSet as projection on views.ItemView;
    
}