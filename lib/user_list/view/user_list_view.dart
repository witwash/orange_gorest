import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_gorest/user_list/bloc/user_list_bloc.dart';
import 'package:orange_gorest/user_list/models/user.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  State<UserListView> createState() => _UserListViewState();

  static const String rawData =
      '''[{"id":2537,"name":"Adityanandana Sinha","email":"sinha_adityanandana@dickens.com","gender":"male","status":"active"},{"id":2536,"name":"Rakesh Patil DDS","email":"dds_patil_rakesh@king-oconnell.name","gender":"female","status":"inactive"},{"id":2535,"name":"Atreyee Rana","email":"atreyee_rana@heidenreich.io","gender":"male","status":"inactive"},{"id":2534,"name":"Ekdant Arora","email":"ekdant_arora@rogahn-hagenes.name","gender":"female","status":"active"},{"id":2533,"name":"Anusuya Marar DO","email":"marar_anusuya_do@walsh.name","gender":"female","status":"inactive"},{"id":2532,"name":"Somu Mahajan","email":"mahajan_somu@ondricka.info","gender":"female","status":"inactive"},{"id":2531,"name":"Gati Kaul V","email":"kaul_v_gati@daugherty.biz","gender":"female","status":"inactive"},{"id":2530,"name":"Giriraaj Nambeesan II","email":"nambeesan_giriraaj_ii@hintz.info","gender":"male","status":"active"},{"id":2529,"name":"Trisha Nair","email":"nair_trisha@abshire.co","gender":"male","status":"active"},{"id":2528,"name":"Vidya Shukla","email":"vidya_shukla@paucek.biz","gender":"female","status":"active"},{"id":2527,"name":"Sher Pillai","email":"pillai_sher@windler.info","gender":"female","status":"inactive"},{"id":2526,"name":"Ahilya Ahluwalia","email":"ahluwalia_ahilya@walsh.biz","gender":"male","status":"active"},{"id":2525,"name":"Kumuda Sethi DDS","email":"dds_sethi_kumuda@marvin-reichert.biz","gender":"male","status":"active"},{"id":2524,"name":"Rajiv Khatri JD","email":"khatri_jd_rajiv@feest-breitenberg.com","gender":"female","status":"active"},{"id":2523,"name":"Balaaditya Deshpande","email":"deshpande_balaaditya@bartoletti.org","gender":"male","status":"inactive"},{"id":2522,"name":"Mr. Bhanumati Tandon","email":"mr_bhanumati_tandon@hintz-hand.io","gender":"male","status":"inactive"},{"id":2521,"name":"Devani Mukhopadhyay","email":"devani_mukhopadhyay@paucek-ledner.com","gender":"female","status":"inactive"},{"id":2520,"name":"Anang Embranthiri","email":"embranthiri_anang@lesch-rodriguez.org","gender":"female","status":"active"},{"id":2519,"name":"Mr. Akshita Namboothiri","email":"akshita_mr_namboothiri@lemke.co","gender":"male","status":"inactive"},{"id":2518,"name":"Gangesh Dubashi","email":"gangesh_dubashi@ryan.io","gender":"female","status":"active"}]''';
}

class _UserListViewState extends State<UserListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListBloc, UserListState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: Text('Hello there'),
          ),
          loading: () => const Center(
            child: Text('Loading...'),
          ),
          loaded: (users) => ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('User: ${users[index].name}'),
                subtitle: Text('Details:  ${users[index].email}'),
              );
            },
            itemCount: users.length,
          ),
        );
      },
    );
  }
}
