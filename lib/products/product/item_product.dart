part of 'view.dart';
class _Item extends StatefulWidget {
  final ProductModel model;
  const _Item({super.key, required this.model});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow:[
              BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  offset: Offset(0, 4),
                  blurRadius: 4.r
              )
            ]
        ),
        child: Column(children: [
          Expanded(
            child: Image.network(widget.model.image,width: double.infinity
                ,fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 7.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.model.title,style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp
                    ),),
                    GestureDetector(
                      onTap: () {
                        widget.model.togegle();
                        setState(() {

                        });
                      },
                      child: Icon(widget.model.isFavorite?Icons.favorite:Icons.favorite_border,
                        color: widget.model.isFavorite?Colors.green:null,),
                    )
                  ],
                ),
                SizedBox(height: 5.h,),
                Text(widget.model.description,
                  maxLines: 3,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis ,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000).withOpacity(.37)
                  ),),
                SizedBox(height: 5.h,),
                Row(children: [
                  Text("${widget.model.price} \$",style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp
                  )),
                  SizedBox(width: 8.w,),
                  Text("${widget.model.priceBeforeDiscount} \$",style: TextStyle(
                      color:Color(0xff000000).withOpacity(.29),
                      decoration: TextDecoration.lineThrough,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700
                  )),
                ]),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff16A124),radius: 15.r,
                    child: Icon(Icons.add_shopping_cart_rounded,color: Colors.white,size: 16),
                  ),
                )
              ],
            ),
          )

        ],),
      ),
    );
  }
}
