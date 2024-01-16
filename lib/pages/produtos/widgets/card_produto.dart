import 'package:comanda_full/data/model/produto.dart';
import 'package:comanda_full/widget/bs_add_produto.dart';
import 'package:comanda_full/widget/bs_add_produto_estoque.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Padding cardProduto(BuildContext context, final Produto produto) {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
                label: 'Editar',
                padding: EdgeInsets.zero,
                onPressed: (context) {
                  bsProduto(context, produto);
                },
                icon: Icons.edit,
                backgroundColor: Theme.of(context).colorScheme.surfaceTint),
            SlidableAction(
              label: 'Inativar',
              padding: EdgeInsets.zero,
              onPressed: (context) {},
              icon: Icons.block,
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            SlidableAction(
              onPressed: (context) {
                bsProdutoEstoque(context);
              },
              label: 'Estoque',
              padding: EdgeInsets.zero,
              icon: Icons.edit_document,
              backgroundColor: Theme.of(context).hintColor,
            )
          ],
        ),
        child: Container(
          height: 120,
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CachedNetworkImage(
                    imageUrl: produto.linkimage,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                child: ListTile(
                  title: Text(produto.nome),
                  subtitle: Text(
                      'COD: ${produto.id}                              R\$${produto.valor.toStringAsFixed(2)} \nEstoque: ${produto.estoque}'),
                ),
              ),
            ],
          ),
        )),
  );
}
